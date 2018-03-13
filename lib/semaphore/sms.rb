require "semaphore/sms/version"
require "semaphore/sms/client"

module Semaphore
  module Sms
    class ::ConfigurationError < StandardError; end

    class << self
      attr_writer :api_key, :sender_name

      def setup
        yield self
        true
      end

      def client
        @client ||= Semaphore::Sms::Client.new(self)
      end

      def api_key
        raise ConfigurationError, 'API Key is required for GET/POST' unless @api_key
        @api_key
      end

      def sender_name
        @sender_name
      end
    end

  end
end
