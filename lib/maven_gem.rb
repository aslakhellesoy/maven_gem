$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'maven_gem/xml_utils'
require 'maven_gem/pom_spec'
require 'maven_gem/pom_fetcher'
require 'rubygems'
require 'rubygems/gem_runner'

module MavenGem
  def self.install(*args)
    gem = build(*args)
    Gem::GemRunner.new.run(["install", gem])
  ensure
    FileUtils.rm_f(gem) if gem
  end

  def self.build(*args)
    options = args.pop if Hash === args[-1]
    if args.length == 1
      url = args[0]
    elsif args.length == 3
      url = MavenGem::PomSpec.to_maven_url(*args)
    else
      raise "Pass <group id> <artifact id> <version> or <pom URL> or <pom FILE>"
    end
    MavenGem::PomSpec.build(url, options)
  end
end
