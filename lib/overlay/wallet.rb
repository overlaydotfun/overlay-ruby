require 'overlay/response'

module Overlay
  class Wallet
    def self.create(params)
      client = Client.new
      res = client.post("/wallets", params)

      Overlay::Response.new(res)
    end
  end
end
