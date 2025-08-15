require 'overlay/response'

module Overlay
  class NFT
    def self.create(params)
      client = Client.new
      res = client.post("/nfts", params)

      Overlay::Response.new(res)
    end

    def self.mint(mint_address, params = {})
      client = Client.new
      res = client.post("/nfts/#{mint_address}/mint", params)

      Overlay::Response.new(res)
    end

    def self.transfer(mint_address, params = {})
      client = Client.new
      res = client.post("/nfts/#{mint_address}/transfer", params)

      Overlay::Response.new(res)
    end

    def self.burn(mint_address, params = {})
      client = Client.new
      res = client.post("/nfts/#{mint_address}/burn", params)

      Overlay::Response.new(res)
    end
  end
end
