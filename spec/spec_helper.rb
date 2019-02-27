require "bundler/setup"
require "page_objects"
require "capybara/rspec"
require "support/capybara"
require "support/path_helper"

# Require page objects
Dir["#{File.dirname(__FILE__)}/support/pages/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
