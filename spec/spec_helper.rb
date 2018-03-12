require "bundler/setup"
require "semaphore/sms"
require "pry"
require "webmock/rspec"

Dir[Pathname.new(File.expand_path('../', __FILE__)).join('semaphore/helpers/*.rb')].each {|f| require f}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.include ResponseHelpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
