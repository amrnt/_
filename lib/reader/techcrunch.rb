require 'reader/base'

module Reader
  class Techcrunch < Base::Provider
    attr_reader :title, :body

    def initialize url, domain = 'www.techcrunch.com'
      @title = Base.xpath super, "//div[@id='module-post-detail']/h1[@class = 'headline']"
      @body  = Base.xpath super, "//div[@id='module-post-detail']/div[@class = 'body-copy']"
    end
  end

  def self.Techcrunch url
    Reader::Techcrunch.new url
  end
end
