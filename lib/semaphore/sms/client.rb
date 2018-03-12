require "curb"
require "json"
require "pry"
require "forwardable"

module Semaphore
  module Sms
    class Client
      extend Forwardable
      Response = Struct.new(:status, :content)

      def initialize(config)
        raise Semaphore::Sms::Error, 'Config must have app credentials' unless config.respond_to? :api_key
        @config = config
      end

      #TODO: add number validation here. Use piliponi gem.
      def send(message, recipients, sendername = nil)
        options = {
          message: message,
          sendername: sendername || sender_name,
          number: recipients.kind_of?(Array) ? recipients.join(",") : recipients
        }.compact
        api_post("messages", options)
      end

      def priority(message, recipients, sendername = nil)
        options = {
          message: message,
          sendername: sendername || sender_name,
          number: recipients.kind_of?(Array) ? recipients.join(",") : recipients
        }.compact
        api_post("priority", options)
      end

      def messages(id: nil)
        api_get("messages#{id.nil? ? "" : "/#{id}"}")
      end

      def account
        api_get("account")
      end

      def transactions(page: nil, limit: 100)
        options = {
          page: page,
          limit: limit
        }
        api_get("account/transactions", options)
      end

      def sender_names(page: nil, limit: 100)
        options = {
          page: page,
          limit: limit
        }
        api_get("account/sendernames", options)
      end

      def users(page: nil, limit: 100)
        options = {
          page: page,
          limit: limit
        }
        api_get("account/users", options)
      end

      private

      def_delegators :@config, :api_key, :sender_name

      BASE_URI = "http://api.semaphore.co/api/v4/"

      def api_post(uri, params = {})
        handle_errors do
          resp = Curl.post("#{BASE_URI}#{uri}", params.merge(apikey: api_key))
          JSON.parse(resp.body_str)
        end
      end

      def api_get(uri, params = {})
        handle_errors do
          resp = Curl.get("#{BASE_URI}#{uri}", params.merge(apikey: api_key))
          JSON.parse(resp.body_str)
        end
      end

      def handle_errors
        begin
          yield
        rescue => e
          Response.new(:error, { error: e.message })
        end
      end
    end
  end
end

