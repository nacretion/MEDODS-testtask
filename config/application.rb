require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MedodsTesttask
  class Application < Rails::Application
    config.active_record.maintain_test_schema = false
    config.use_transactional_tests = true

    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.api_only = true
  end
end
