# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'maven_gem'
  s.version     = '0.0.4'
  s.authors     = ["Charles Nutter", "David Calavera"]
  s.description = 'MavenGem is a command and RubyGems plugin for packaging Maven artifacts as gems.'
  s.summary     = "Packaging Maven artifacts as Rubygems."
  s.email       = 'headius@headius.com'
  s.homepage    = 'http://github.com/jruby/maven_gem'

  s.add_development_dependency 'rspec', '~> 2.0.0.beta.22'
  s.add_development_dependency 'mocha', '~> 0.9.8'
  s.add_development_dependency 'webmock', '~> 1.3.5'

  s.rubygems_version   = "1.3.7"
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ["LICENSE.txt", "README.txt"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
