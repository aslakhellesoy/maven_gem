require 'maven_gem'
require 'mocha'

RSpec.configure do |config|
  config.mock_with :mocha
end

FIXTURES = File.join(File.dirname(__FILE__), 'fixtures')
