require File.join(File.dirname(__FILE__), 'helper')

class AdapterTest < Test::Unit::TestCase
  context DataMapper::Adapters::TokyoCabinetAdapter do
    context 'Serial key resource' do
      setup do
        class ::User
          include DataMapper::Resource
          property :id, Serial
          property :name, String
          property :age, Integer
        end

        @user = User.create(:name => 'Joe', :age => 22)
      end

      teardown do
        User.all.destroy
      end

      should 'assign id to attributes' do
        item = User.create
        assert_kind_of User, item
        assert_not_nil item.id
      end

      should 'get an item' do
        assert_equal @user, User.get(@user.id)
      end

      should 'get items' do
        assert_equal 1, User.all.size
      end

      should 'destroy item' do
        assert @user.destroy
        assert_equal 0, User.all.size
      end

      should 'update item' do
        @user.name = 'Woot'
        assert @user.save
        assert_equal 'Woot', User.get(@user.id).name
      end
    end

    context 'Compound key resource' do
      setup do
        class ::User
          include DataMapper::Resource
          property :name, String, :key => true
          property :age, Integer, :key => true
        end

        @user = User.create(:name => 'Joe', :age => 22)
      end

      teardown do
        User.all.destroy
      end

      should 'get an item' do
        assert_equal @user, User.get(*@user.key)
      end
    end

    context 'Relationship same db' do
      setup do
        class ::User
          include DataMapper::Resource

          has n, :comments

          property :id, Serial
          property :name, String
        end
        class ::Comment
          include DataMapper::Resource

          belongs_to :user

          property :id, Serial
          property :content, String
        end
      end

      should 'map object' do
        @user= User.create(:name => 'Joe')
        @comment= Comment.create(:content => 'Foo')

        @user.comments << @comment
        @user.save

        assert_equal 1, @user.comments.length
      end
      
      teardown do
        User.all.destroy
        Comment.all.destroy
      end
    end

    context 'Relationship different db' do
      setup do
        class ::User
          include DataMapper::Resource

          has n, :comments

          property :id, Serial
          property :name, String
        end
        class ::Comment
          include DataMapper::Resource

          def self.default_repository_name
            :sqlite
          end
          belongs_to :user

          property :id, Serial
          property :content, String
        end
        DataMapper.auto_migrate!(:sqlite)        
      end

      should 'map object' do
        @user= User.create(:name => 'Joe')
        @comment= Comment.create(:content => 'Foo')

        @user.comments << @comment
        @user.save

        assert_equal 1, @user.comments.length
      end

      teardown do
        User.all.destroy
        Comment.all.destroy
      end
    end
  end
end
