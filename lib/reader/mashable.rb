require 'reader/base'

module Reader
  class Mashable < Base::Provider
    attr_reader :title, :body

    def initialize url, domain = 'www.mashable.com'
      
        # .full


      @title = Base.xpath super, "//div[@id='post-content']/div[@id='post-slider']/article[@id='story']/header[@class='article-header']/h1[@class='title']"
      @body  = Base.xpath super, "//div[@id='post-content']/div[@id='post-slider']/article[@id='story']/section[@class='article-content']"



    end
  end

  def self.Mashable url
    Reader::Mashable.new url
  end
end
