require 'open-uri'

module MavenGem
  class PomFetcher
    def self.fetch(uri)
      clean_pom(Kernel.open(uri).read)
    end

    private

    def self.clean_pom(pom) #avoid namespaces errors and gotchas
      pom.gsub(/<project[^>]+/, '<project>')
    end
  end
end
