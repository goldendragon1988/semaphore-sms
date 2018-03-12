require "spec_helper"

RSpec.describe Semaphore::Sms do
  it "has a version number" do
    expect(Semaphore::Sms::VERSION).not_to be nil
  end

  describe ".setup" do
    it "setup block yields self" do
      expect { |b| Semaphore::Sms.setup(&b) }.to yield_control
    end
  end

  describe ".client" do
    it "returns instance of client" do
      expect(Semaphore::Sms.client).to be_a Semaphore::Sms::Client
    end
  end

  describe ".api_key" do
    it "raises Semaphore Error if api key is not define" do
      expect{Semaphore::Sms.api_key}.to raise_error(Error)
    end

    it "returns the api key" do
      Semaphore::Sms.setup do |config|
        config.api_key = "YOUR API KEY"
      end

      expect(Semaphore::Sms.api_key).to eq "YOUR API KEY"
    end
  end

  describe ".sender_name" do
    it "returns nil if no sender name is setup" do
      expect(Semaphore::Sms.sender_name).to eq nil
    end

    it "returns the sender name" do
      Semaphore::Sms.setup do |config|
        config.sender_name = "saitama"
      end
      expect(Semaphore::Sms.sender_name).to eq "saitama"
    end
  end

  describe "client" do
    before do
      Semaphore::Sms.setup do |config|
        config.api_key = "XXXX"
      end
      account_uri = "http://api.semaphore.co/api/v4/account?apikey=XXXX"
      stub_request(:get, account_uri).to_return(body: account_response)
    end

    describe ".account" do
      it "returns account information" do
        account = Semaphore::Sms.client.account
        expect(account["account_id"]).to eq 4688
        expect(account["account_name"]).to eq "FreeLance"
        expect(account["status"]).to eq "Active"
        expect(account["credit_balance"]).to eq "504"
      end
    end
  end
end
