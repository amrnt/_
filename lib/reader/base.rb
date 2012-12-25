require 'faraday'
require 'nokogiri'
require 'multi_json'

module Reader
  module Base
    class Provider
      def initialize url
        @doc ||= Base.get url
      end

      def as_hash
        Base.hash(self)
      end

      def as_json
        Base.as_json as_hash
      end
    end

    def self.make_request url
      Faraday.get url
    end

    def self.parse_body body
      Nokogiri::HTML body
    end

    def self.get url
      response = make_request url
      parse_body response.body
    end

    def self.xpath doc, xpath
      doc.xpath(xpath).first.text.strip.chomp
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