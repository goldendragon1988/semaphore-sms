require "semaphore/sms/version"
require "semaphore/sms/client"

module Semaphore
  module Sms
    class ::Error < StandardError; end

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
        #raise Error, 'API Key is required for GET/POST' unless @api_key
        @api_key ||= "b08e7bb96398e2d8a17cc913a66de59d"
      end

      def sender_name
        @sender_name
      end
    end

  end
end
