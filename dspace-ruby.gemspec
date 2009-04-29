# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dspace-ruby}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Fixler"]
  s.date = %q{2009-04-29}
  s.email = %q{nathan@fixler.org}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/dspace/active_record.rb",
    "lib/dspace/active_record/collection.rb",
    "lib/dspace/active_record/community.rb",
    "lib/dspace/active_record/handle.rb",
    "lib/dspace/active_record/item.rb",
    "lib/dspace/config.rb",
    "test/dspace_config_test.rb",
    "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/fixlr/dspace-ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TODO}
  s.test_files = [
    "test/dspace_config_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
