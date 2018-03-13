require "curb"
require "json"
require "forwardable"
require "piliponi"

module Semaphore
  module Sms
    class ::PhoneNumberError < StandardError; end

    class Client
      extend Forwardable

      Response = Struct.new(:status, :content)

      def initialize(config)
        raise ConfigurationError, 'Config must have api key credentials' unless config.respond_to? :api_key
        @config = config
      end

      def send(message, recipients, sendername = nil)
        recipients = clean_and_validate(recipients)

        raise PhoneNumberError, 'Please verify the phonenumber' unless recipients

        options = {
          message: message,
          sendername: sendername || sender_name,
          number: recipients
        }.compact
        api_post("messages", options)
      end

      def priority(message, recipients, sendername = nil)
        recipients = clean_and_validate(recipients)

        raise PhoneNumberError, 'Please verify the phonenumber' unless recipients

        options = {
          message: message,
          sendername: sendername || sender_name,
          number: recipients.kind_of?(Array) ? recipients.join(",") : recipients
        }.compact
        api_post("priority", options)
      end

      def messages(id: nil, page: nil, limit: nil, start_date: nil, end_date: nil, network: nil, status: nil)
        options = {
          page: page,
          limit: limit,
          startDate: start_date,
          endDate: end_date,
          network: network,
          status: status
        }.compact
        api_get("messages#{id.nil? ? "" : "/#{id}"}", options)
      end

      def account
        api_get("account")
      end

      def transactions(page: nil, limit: nil)
        options = {
          page: page,
          limit: limit
        }.compact
        api_get("account/transactions", options)
      end

      def sender_names(page: nil, limit: nil)
        options = {
          page: page,
          limit: limit
        }.compact
        api_get("account/sendernames", options)
      end

      def users(page: nil, limit: nil)
        options = {
          page: page,
          limit: limit
        }.compact
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

      def clean_and_validate(recipients)
        if recipients.kind_of?(Array)
          recipients = recipients.reduce([]) do |mem, num|
            mem << (validate(num) ? clean(num) : false)
            mem
          end
          recipients.include?(false) ? false : recipients.join(",")
        else
          recipients = clean(recipients)
          validate(recipients) ? recipients : false
        end
      end

      def handle_errors
        begin
          yield
        rescue => e
          Response.new(:error, { error: e.message })
        end
      end

      def clean(num)
        Piliponi.clean num
      end

      def validate(num)
        Piliponi.plausible? num
      end
    end
  end
end

