# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-tokyo-adapter}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shane Hanna"]
  s.date = %q{2009-08-09 2010-10-14}
  s.email = %q{shane.hanna@gmail.com joshua.partogi@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "dm-tokyo-adapter.gemspec",
     "lib/dm-tokyo-adapter.rb",
     "lib/dm-tokyo-adapter/cabinet.rb",
     "lib/dm-tokyo-adapter/query.rb",
     "lib/dm-tokyo-adapter/tyrant.rb",
     "lib/dm-tokyo-adapter/version.rb",
     "test/helper.rb",
     "test/test_cabinet.rb",
     "test/test_query.rb",
     "test/test_tyrant.rb"
  ]
  s.homepage = %q{http://github.com/shanna/dm-tokyo-adapter}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Tokyo Cabinet/Tyrant Table DataMapper Adapter.}
  s.test_files = [
    "test/helper.rb",
     "test/test_cabinet.rb",
     "test/test_query.rb",
     "test/test_tyrant.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, [">= 1.0.2"])
      s.add_dependency(%q<rufus-tokyo>, ">= 1.0.7")
      s.add_dependency(%q<addressable>, ">= 2.2.2")
    else
      s.add_dependency(%q<dm-core>, [">= 1.0.2"])
      s.add_dependency(%q<rufus-tokyo>, ">= 1.0.7")
      s.add_dependency(%q<addressable>, ">= 2.2.2")
    end
  else
    s.add_dependency(%q<dm-core>, [">= 1.0.2"])
    s.add_dependency(%q<rufus-tokyo>, ">= 1.0.7")
    s.add_dependency(%q<addressable>, ">= 2.2.2")
  end
end
