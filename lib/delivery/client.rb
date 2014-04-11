require 'httparty'
require 'hashie'
require 'json'

module Delivery
  class Client
    include HTTParty

    attr_accessor :client_id, :base_uri

    def initialize(client_id, options={})
      @client_id = client_id

      options[:base_uri] ||= 'https://api.delivery.com'
      @base_uri = options[:base_uri]
    end

    def search address
      options = {query: {client_id: client_id, address: address}}
      r = self.class.get("#{base_uri}/merchant/search/delivery", options)
      Hashie::Mash.new(JSON.parse(r.body))
    end
  end
end
