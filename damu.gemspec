# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','damu','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'DaMu'
  s.version = DaMu::VERSION
  s.author = 'Nathaniel Adam'
  s.email = 'iammanyadamsatgeemaildotcom'
  s.homepage = 'https://github.com/iammanyadams/cliproject'
  s.platform = Gem::Platform::RUBY
  s.summary = 'datamuse.com'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.extra_rdoc_files = ['README.rdoc','damu.rdoc']
  s.rdoc_options << '--title' << 'damu' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'damu'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.19.2')
end
