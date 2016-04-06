require 'sidekiq'

size = ENV['REDIS_SIZE'].nil? ? 1 : ENV['REDIS_SIZE'].to_i
url  = ENV['REDIS_URL'].nil? ? 'redis://localhost:6379/0' : ENV['REDIS_URL']

Sidekiq.configure_client do |config|
  config.redis = { :size => size, url: url }
end

require 'sidekiq/web'
run Rack::URLMap.new('/' => Sidekiq::Web)
