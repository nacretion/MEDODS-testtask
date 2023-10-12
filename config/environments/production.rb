require "active_support/core_ext/integer/time"

Rails.application.configure do

  config.enable_reloading = false
  config.eager_load = true

  config.consider_all_requests_local = false
  config.public_file_server.enabled = true
  config.active_storage.service = :local

  config.force_ssl = true
  config.hosts << "medods.nacretion.space"
  config.logger = ActiveSupport::Logger.new(STDOUT)
                                       .tap { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Поменять если нужно. Протестить mailer можно воспользовавшись https://medods.nacreton.space/{ENDPOINT}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.example.com',
    port: 587,
    domain: 'domain',
    user_name: 'example@domain.ru',
    password: 'password',
    authentication: :login,
    enable_starttls_auto: true,
  }
  config.log_tags = [:request_id]

  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true

  config.active_support.report_deprecations = false

  config.active_record.dump_schema_after_migration = false
end
