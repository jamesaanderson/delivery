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

    def search(address, options={})
      get('/merchant/search/delivery', {address: address}.merge(options))
    end
    alias_method :merchant_search, :search

    def info(id, options={})
      get("/merchant/#{id}", options)
    end
    alias_method :merchant_info, :info

    def menu(id, options={})
      get("/merchant/#{id}/menu", options)
    end
    alias_method :merchant_menu, :menu

    def hours(id, options={})
      get("/merchant/#{id}/hours", options)
    end
    alias_method :merchant_hours, :hours

    private

    def get(path, options={})
      http_verb :get, path, options
    end

    def http_verb(verb, path, options={})
      response = self.class.send(verb, "#{base_uri}#{path}", {query: {client_id: client_id}.merge(options)})
      Hashie::Mash.new(JSON.parse(response.body))
    end
  end
end
