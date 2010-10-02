require 'spec_helper'

describe MavenGem do
  describe "build" do
    it "creates a gem with group, artifact and version" do
      gem_file = MavenGem.build('ant', 'ant', '1.6.5', 'tmp', {:verbose => true})
      gem_file.should == 'tmp/ant.ant-1.6.5-java.gem'
      File.should exist(gem_file)
    end
  end
end
