require 'rubygems/command'
require 'maven_gem'

class Gem::Commands::MavenCommand < Gem::Command

  def initialize
    super('maven', 'Install a Maven-published Java library as a gem', {:dir => '.', :keep => false, :verbose => false})

    add_option('-d', '--dir DIR', 'Directory where temporary gem gets created') do |dir, options|
      options[:dir] = dir
    end

    add_option('-k', '--keep', 'Do not delete the temporary gem file') do |value, options|
      options[:keep] = trye
    end

    add_option('-v', '--verbose', 'Be extra verbose') do |value, options|
      options[:verbose] = true
    end
  end

  def defaults_str # :nodoc:
    "--dir . --no-keep"
  end

  def execute
    args = options[:args]
    MavenGem.install(*(args + [options]))
  end

end

