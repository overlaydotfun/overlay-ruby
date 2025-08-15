require 'overlay/response'

module Overlay
  class Token
    def self.create(params)
      client = Client.new
      res = client.post("/tokens", params)

      Overlay::Response.new(res)
    end

    def self.mint(mint_address, params = {})
    	raise "amount is required" unless params[:amount]

      client = Client.new
      res = client.post("/tokens/#{mint_address}/mint", params)

      Overlay::Response.new(res)
    end

    def self.transfer(mint_address, params = {})
      client = Client.new
      res = client.post("/tokens/#{mint_address}/transfer", params)

      Overlay::Response.new(res)
    end

    def self.burn(mint_address, params = {})
      client = Client.new
      res = client.post("/tokens/#{mint_address}/burn", params)

      Overlay::Response.new(res)
    end
  end
end
