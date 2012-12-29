require 'reader/base'

module Reader
  class AljazeeraEnglish < Base::Provider
    attr_reader :title, :body

    def initialize url, domain = 'www.aljazeera.com'
      @title = Base.xpath super, "//*[(@id = \"DetailedTitle\")]"
      @body  = Base.xpath super, "//*[(@id = \"tdTextContent\")] | //p"
    end
  end

  def self.AljazeeraEnglish url
    Reader::AljazeeraEnglish.new url
  end

end
