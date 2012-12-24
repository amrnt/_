module Reader
  class Techcrunch
    def initialize(url)
      @response ||= Faraday.get url
      @doc ||= Nokogiri::HTML(@response.body)
    end

    def title
      @doc.search('div.module-post-detail h1.headline').first.text
    end

    def body
      @doc.search('div.module-post-detail div.body-copy').first.text
    end
  end

  def self.Techcrunch(url)
    Techcrunch.new(url)
  end
end