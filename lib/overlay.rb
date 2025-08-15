# frozen_string_literal: true

require_relative "overlay/version"
require_relative "overlay/config"
require_relative "overlay/client"
require_relative "overlay/wallet"
require_relative "overlay/token"
require_relative "overlay/nft"

module Overlay
  class Error < StandardError; end

  class << self
    def configure
      yield(Config)
    end
  end
end