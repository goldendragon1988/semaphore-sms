# Semaphore::Sms

This is a ruby api wrapper for Semaphore, https://semaphore.co/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'semaphore-sms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install semaphore-sms

## Usage

Run:
```ruby
rails g semaphore:sms:install
```

Note:

  This will generate a file in `config/initializers` called `semaphore-sms.rb`. Configure semaphore api here.

```
Semaphore::Sms.setup do |config|
  # config.api_key = "YOUR API KEY HERE"
  # NOTE: add if you want to use a single sender name by default.
  # config.sender_name = "SEMAPHORE"
end
```
Below we demonstrate the most basic usage of the library:

```ruby
require "semaphore-sms"

# You should already configure you api key under `initializers/semaphore-sms.rb`
    client = Semaphore::Sms.client

# Sending a single message.

    client.send("Hello World", "09175488888")

  # response

    [
      {
        "message_id" => 55871500,
        "user_id" => 4788,
        "user" => "jag.arnold.go@gmail.com",
        "account_id" => 4688,
        "account" => "FreeLance",
        "recipient" => "639778048888",
        "message" => "Hello World",
        "sender_name" => "Semaphore",
        "network" => "Next",
        "status" => "Pending",
        "type" => "Single",
        "source" => "Api",
        "created_at" => "2018-03-12 20:11:21",
        "updated_at" => "2018-03-12 20:11:21"
      }
    ]

# Sending a single message to multiple recipients or bulk messages.

    client.send("Hello World", ["09175488888","09778048888"])

  # response

    [
      {
        "message_id" => 55871554,
        "user_id" => 4788,
        "user" => "jag.arnold.go@gmail.com",
        "account_id" => 4688,
        "account" => "FreeLance",
        "recipient" => "639175488888",
        "message" => "Hello World",
        "sender_name" => "Semaphore",
        "network" => "Globe",
        "status" => "Pending",
        "type" => "Bulk",
        "source" => "Api",
        "created_at" => "2018-03-12 20:16:46",
        "updated_at" => "2018-03-12 20:16:46"
      },
      {
        "message_id" => 55871555,
        "user_id" => 4788,
        "user" => "jag.arnold.go@gmail.com",
        "account_id" => 4688,
        "account" => "FreeLance",
        "recipient" => "639778048888",
        "message" => "Hello World",
        "sender_name" => "Semaphore",
        "network" => "Next",
        "status" => "Pending",
        "type" => "Bulk",
        "source" => "Api",
        "created_at" => "2018-03-12 20:16:46",
        "updated_at" => "2018-03-12 20:16:46"
      }
    ]


# Sending a message using a sender name.

    client.send("Hello World", ["09175488888", "09175488888"], "SAITAMA")

    NOTE: By default you can configure your sender name in `config/initializers/semaphore-sms` or
          pass a third agument to overwrite existing sender name in `initializers/semaphore-sms.rb`.
          If no sendername is attached it will default to `Semaphore`.


## Sending a single priority message.

    client.priority("Hello World", "09175488888")

## Sending a single priority message to multiple recipients or bulk messages.

    client.priority("Hello World", ["09175488888","09778048888"])

## Requesting for account information

    client.account

## Requesting for all the messages sent

    client.messages

    client.messages(
      id: nil,
      page: nil,
      limit: nil,
      start_date: nil,
      end_date: nil,
      network: nil,
      status: nil
    )

    # Note: all params are optional.
      Format is "YYYY-MM-DD" for date,
      Format is lowercase (e.g. "globe", "smart") for network,
      Format is lowercase (e.g. "pending", "success") for status

## Requesting for a specific message

    client.messages(id: 55871555)

## Requesting for all transaction made

    client.transactions
    client.transactions(id: 1, limit: 100) # Page and Limit are optional. Limit default to 100 and page 1.

## Requesting for all sender names

    client.sender_names
    client.sender_name(id: 1, limit: 100) # Page and Limit are optional. Limit default to 100 and page 1.

## Requesting for all users

    client.users
    client.users(id: 1, limit: 100) # Page and Limit are optional. Limit default to 100 and page 1.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/goldendragon1988/semaphore-sms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Semaphore::Sms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/semaphore-sms/blob/master/CODE_OF_CONDUCT.md).
