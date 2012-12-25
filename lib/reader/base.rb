require 'open-uri'
require 'faraday'
require 'nokogiri'
require 'multi_json'

module Reader
  module Base
    class Provider
      def initialize url, domain
        raise(StandardError, 'Couldn\'t fetch your link through this class!') unless domain.include? URI(url).host
        @document ||= Base.get url
      end

      def as_hash
        Base.hash(self)
      end

      def as_json
        Base.as_json as_hash
      end
    end

    def self.get url
      response = make_request url
      raise(StandardError, 'Error while fetching the link. Status: not 200') unless response.status == 200
      parse_body response.body
    end

    def self.xpath doc, xpath
      doc.xpath(xpath).first.text.strip.chomp
    end

  private

    def self.make_request url
      Faraday.get url
    end

    def self.parse_body body
      Nokogiri::HTML body
    end

    def self.hash obj
      a, hsh = (obj.class.instance_methods - Object.methods - [:as_json, :as_hash]), {}
      a.each { |x| hsh[x] = obj.send(x) }
      hsh
    end

    def self.as_json hash
      MultiJson.dump hash
    end

  end
end