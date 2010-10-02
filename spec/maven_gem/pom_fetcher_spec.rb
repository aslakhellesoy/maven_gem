require 'spec_helper'

describe MavenGem::PomFetcher do
  
  it "removes namespaces from pom file" do
    ant_url = "http://mirrors.ibiblio.org/pub/mirrors/maven2/ant/ant/1.6.5/ant-1.6.5.pom"
    pom = MavenGem::PomFetcher.fetch(ant_url)
    pom.should =~ /<project>/
  end

  it "reads the pom file from the system when the path is not an url" do
    ant_url = File.dirname(__FILE__) + "/../fixtures/ant/ant/1.6.5/ant-1.6.5.pom"
    pom = MavenGem::PomFetcher.fetch(ant_url)
    pom.should =~ /<project>/
  end
end
