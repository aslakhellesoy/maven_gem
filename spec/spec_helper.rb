require 'maven_gem'
require 'mocha'
require 'webmock'
require 'fileutils'

RSpec.configure do |config|
  config.mock_with :mocha

  config.before do
    Dir['tmp/*.gem'].each{|gem| FileUtils.rm(gem)}
    
    WebMock.reset_webmock

    maven_repo = File.join(File.dirname(__FILE__), 'fixtures')
    Dir["#{maven_repo}/**/*.pom"].each do |pom|
      relative_path = pom[maven_repo.length+1..-1]
      pom_url = "http://mirrors.ibiblio.org/pub/mirrors/maven2/#{relative_path}"
      jar_url = pom_url.gsub(/\.pom$/, '.jar')

      WebMock.stub_request(:get, pom_url).to_return do |request| 
        {:body => IO.read(pom)}
      end

      WebMock.stub_request(:get, jar_url).to_return do |request| 
        {:body => "A fake jar for #{jar_url}"}
      end
    end
  end
end
