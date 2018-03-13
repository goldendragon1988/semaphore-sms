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
      expect{Semaphore::Sms.api_key}.to raise_error(ConfigurationError)
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
        config.sender_name = "TEST"
      end

      #NOTE: GET REQUEST
      account_uri = "http://api.semaphore.co/api/v4/account?apikey=XXXX"
      stub_request(:get, account_uri).to_return(body: account_response)

      messages_uri = "http://api.semaphore.co/api/v4/messages?apikey=XXXX"
      stub_request(:get, messages_uri).to_return(body: messages_response)

      message_uri = "http://api.semaphore.co/api/v4/messages/55870891?apikey=XXXX"
      stub_request(:get, message_uri).to_return(body: message_response)

      transactions_uri = "http://api.semaphore.co/api/v4/account/transactions?apikey=XXXX"
      stub_request(:get, transactions_uri).to_return(body: transactions_response)

      sendernames_uri = "http://api.semaphore.co/api/v4/account/sendernames?apikey=XXXX"
      stub_request(:get, sendernames_uri).to_return(body: sendernames_response)

      users_uri = "http://api.semaphore.co/api/v4/account/users?apikey=XXXX"
      stub_request(:get, users_uri).to_return(body: users_response)

      #NOTE: POST REQUEST
      send_uri = "http://api.semaphore.co/api/v4/messages"
      stub_request(:post, send_uri)
        .with(body: "message=I+love+you+so+much&sendername=TEST&number=09778048888&apikey=XXXX")
        .to_return(body: send_response)

      stub_request(:post, send_uri)
        .with(body: "message=Hello+world&sendername=TEST&number=09175488888%2C09778048888&apikey=XXXX")
        .to_return(body: bulk_send_response)

      priority_uri = "http://api.semaphore.co/api/v4/priority"
      stub_request(:post, priority_uri)
        .with(body: "message=I+love+you+so+much&sendername=TEST&number=09778048888&apikey=XXXX")
        .to_return(body: priority_response)

      stub_request(:post, priority_uri)
        .with(body: "message=I+love+you+so+much&sendername=TEST&number=09778048888%2C09175488888&apikey=XXXX")
        .to_return(body: bulk_priority_response)
    end

    describe ".send" do
      it "raises error if invalid phone number" do
        expect{Semaphore::Sms.client.send("hello", "wat")}.to raise_error(PhoneNumberError)
      end

      it "raises error if one number is invalid" do
        expect{Semaphore::Sms.client.send("hello", ["09175488888", "wat"])}.to raise_error(PhoneNumberError)
      end

      it "send a single message" do
        messages = Semaphore::Sms.client.send("I love you so much", "09778048888")
        item = messages.first

        expect(item["message_id"]).to eq 55871500
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639778048888"
        expect(item["message"]).to eq "I love you so much"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Next"
        expect(item["status"]).to eq "Pending"
        expect(item["type"]).to eq "Single"
        expect(item["source"]).to eq "Api"
      end

      it "send a single message to multiple recipients" do
        messages = Semaphore::Sms.client.send("Hello world", ["09175488888","09778048888"])
        item = messages.first

        expect(messages.count).to eq 2
        expect(item["message_id"]).to eq 55871554
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639175488888"
        expect(item["message"]).to eq "Hello World"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Globe"
        expect(item["status"]).to eq "Pending"
        expect(item["type"]).to eq "Bulk"
        expect(item["source"]).to eq "Api"
      end
    end

    describe ".priority" do
      it "raises error if invalid phone number" do
        expect{Semaphore::Sms.client.priority("hello", "wat")}.to raise_error(PhoneNumberError)
      end

      it "raises error if one number is invalid" do
        expect{Semaphore::Sms.client.priority("hello", ["09175488888", "wat"])}.to raise_error(PhoneNumberError)
      end

      it "send a single message" do
        messages = Semaphore::Sms.client.priority("I love you so much", "09778048888")
        item = messages.first

        expect(item["message_id"]).to eq 55871579
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639778048888"
        expect(item["message"]).to eq "I love you so much"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Next"
        expect(item["status"]).to eq "Pending"
        expect(item["type"]).to eq "Priority"
        expect(item["source"]).to eq "Api"

      end

      it "send a single message to multiple recipients" do
        messages = Semaphore::Sms.client.priority("I love you so much", ["09778048888","09175488888"])
        item = messages.first

        expect(messages.count).to eq 2
        expect(item["message_id"]).to eq 55871602
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639778048888"
        expect(item["message"]).to eq "I love you so much"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Next"
        expect(item["status"]).to eq "Pending"
        expect(item["type"]).to eq "Priority"
        expect(item["source"]).to eq "Api"

      end
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

    describe ".messages" do
      it "returns all messages" do
        messages = Semaphore::Sms.client.messages
        item = messages.first
        expect(messages.count).to eq 6
        expect(item["message_id"]).to eq 55839067
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639175488888"
        expect(item["message"]).to eq "This is my first message using semaphore"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Globe"
        expect(item["status"]).to eq "Sent"
        expect(item["type"]).to eq "Single"
      end

      it "returns a single message" do
        messages = Semaphore::Sms.client.messages(id: 55870891)
        item = messages.first
        expect(messages.count).to eq 1
        expect(item["message_id"]).to eq 55870891
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["account_id"]).to eq 4688
        expect(item["account"]).to eq "FreeLance"
        expect(item["recipient"]).to eq "639778048888"
        expect(item["message"]).to eq "Hello world"
        expect(item["sender_name"]).to eq "Semaphore"
        expect(item["network"]).to eq "Next"
        expect(item["status"]).to eq "Sent"
        expect(item["type"]).to eq "Bulk"
      end
    end

    describe ".transaction" do
      #TODO: add limit and page
      it "returns all transactions" do
        transactions = Semaphore::Sms.client.transactions
        item = transactions.first

        expect(transactions.count).to eq 8
        expect(item["id"]).to eq 10938708
        expect(item["user_id"]).to eq 4788
        expect(item["user"]).to eq "jag.arnold.go@gmail.com"
        expect(item["transaction_method"]).to eq "Cash"
        expect(item["amount"]).to eq "250.00"
        expect(item["credit_value"]).to eq "500"
      end
    end

    describe ".sender_names" do
      #TODO: add limit and page
      it "returns all sender_names" do
        sender_names = Semaphore::Sms.client.sender_names
        item = sender_names.first

        expect(sender_names.count).to eq 1
        expect(item["name"]).to eq "JNR"
        expect(item["status"]).to eq "Pending"
      end
    end

    describe ".users" do
      it "returns all users" do
        users = Semaphore::Sms.client.users
        item = users.first

        expect(users.count).to eq 1
        expect(item["role"]).to eq "Owner"
        expect(item["user_id"]).to eq 4788
        expect(item["email"]).to eq "jag.arnold.go@gmail.com"
      end
    end
  end
end
