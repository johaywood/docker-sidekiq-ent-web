require 'sidekiq-ent'
require 'sidekiq-ent/web'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
end

run Sidekiq::Web
