require 'reader/base'

module Reader
  class Techcrunch < Base::Provider
    attr_reader :title, :body

    def initialize url
      doc = super
      @title = Base.xpath doc, "//div[@id='module-post-detail']/h1[@class = 'headline']"
      @body = Base.xpath doc, "//div[@id='module-post-detail']/div[@class = 'body-copy']"
    end
  end

  def self.Techcrunch url
    Reader::Techcrunch.new url
  end
end
