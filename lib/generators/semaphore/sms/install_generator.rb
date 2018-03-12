module Semaphore
  module Sms
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../templates", __FILE__)
      desc "This generator creates an semaphore.rb file at config/initializers"
      def copy_initializer_file
        copy_file "semaphore-sms.rb", "config/initializers/semaphore-sms.rb"
      end
    end
  end
end
