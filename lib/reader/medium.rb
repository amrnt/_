require 'reader/base'

module Reader
  class Medium < Base::Provider
    attr_reader :title, :body, :author, :publish_date

    def initialize url, domain = 'www.medium.com'
      @title = Base.xpath super, "//section[@class=\"post-content\"]/header/h1"
      @body  = Base.xpath super, "//section[@class=\"post-content\"]/div[@class=\"post-field body\"]"
      @author = {
        :name => Base.xpath(super, "//section[@class=\"post-content\"]/header/div/a[@class=\"post-author\"]"),
        :link => 'https://medium.com' + Base.xpath(super, "//section[@class=\"post-content\"]/header/div/a[@class=\"post-author\"]", 'href')
      }
      @publish_date = Base.xpath super, "//section[@class=\"post-content\"]/div[@class=\"actions-and-date\"]/time"
    end
  end

  def self.Medium url
    Reader::Medium.new url
  end
end
