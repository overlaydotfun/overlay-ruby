require "httpx"
require "json"

module Overlay
  class Client
    def initialize(api_key: Config.api_key, auth_key: Config.auth_key, base_url: Config.base_url)
      @api_key = api_key
      @auth_key = auth_key
      @base_url = base_url
    end

    def post(path, payload)
      res = HTTPX.with_headers(headers).post("#{@base_url}#{path}", json: payload)
      handle_response(res)
    end

    private

    def headers
      {
        "api-key" => @api_key,
        "auth-key" => @auth_key,
        "Content-Type" => "application/json"
      }
    end

    def handle_response(res)
      JSON.parse(res.to_s)
    end
  end
end