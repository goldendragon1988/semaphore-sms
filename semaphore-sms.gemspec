
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "semaphore/sms/version"

Gem::Specification.new do |spec|
  spec.name          = "semaphore-sms"
  spec.version       = Semaphore::Sms::VERSION
  spec.authors       = ["Jim Arnold Go"]
  spec.email         = ["jag.arnold.go@gmail.com"]

  spec.summary       = %q{Semaphore-sms api gem}
  spec.description   = %q{Send text in the philippines via https://semaphore.co/}
  spec.homepage      = "https://semaphore.co/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
    #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
    #raise "RubyGems 2.0 or newer is required to protect against " \
      #"public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "curb", "~> 0.9.4"
  spec.add_dependency "piliponi", "~> 1.2", ">= 1.2.1"
  #spec.add_dependency "json", "~> 2.1.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock", "~> 3.3"
  spec.add_development_dependency "awesome_print", "~> 1.8"
  spec.add_development_dependency "rspec", "~> 3.0"
end
