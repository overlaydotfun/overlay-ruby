require "json"

module Overlay
  class Response
    attr_reader :data, :message, :success

    def initialize(hash)
      @success = hash["success"]
      @message = hash["message"]
      @data = hash["data"] || {}

      # data 配下のキーを最上位でもアクセス可能にする
      @data.each do |k, v|
        define_singleton_method(k) { v }
      end

      # top-level keys もメソッド化
      (hash.keys - ["data"]).each do |k|
        define_singleton_method(k) { hash[k] }
      end
    end

    # JSON 表示用
    def to_h
      { success: success, message: message }.merge(data)
    end

    # JSON pretty print 用
    def to_json_pretty
      JSON.pretty_generate(to_h)
    end

    # inspect と to_s を JSON 表示にオーバーライド
    def inspect
      to_json_pretty
    end

    def to_s
      to_json_pretty
    end
  end
end
