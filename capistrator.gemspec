# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capistrator}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andriy Yanko"]
  s.date = %q{2009-03-03}
  s.description = %q{Set of taks for Capistrano 2}
  s.email = ["andriy.yanko@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/capistrator.rb", "lib/capistrator/tasks/crontab.rb", "lib/capistrator/tasks.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github/ayanko/capistrator}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{capistrator}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Set of taks for Capistrano 2}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 2.5.1"])
    else
      s.add_dependency(%q<capistrano>, [">= 2.5.1"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 2.5.1"])
  end
end
