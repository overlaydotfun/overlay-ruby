module Overlay
  module Config
    class << self
      attr_accessor :api_key, :auth_key, :env, :base_url

      def env=(value)
        @env = value.to_s
        @base_url = case @env
                    when "devnet"
                      "https://devnet.overlay.fun"
                    when "mainnet"
                      "https://mainnet.overlay.fun"
                    else
                      raise ArgumentError, "Invalid env: #{@env} (use 'devnet' or 'mainnet')"
                    end
      end
    end

    self.env = "devnet"
  end
end
