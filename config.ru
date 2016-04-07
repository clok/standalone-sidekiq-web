cron = (ENV['SIDEKIQ_CRON'].nil? || ENV['SIDEKIQ_CRON'] == 'false') ? false : true
basic_auth = (ENV["SIDEKIQ_USERNAME"].nil? || ENV["SIDEKIQ_PASSWORD"].nil?) ? false : true

require 'sidekiq'
require 'sidekiq-cron' if cron

size = ENV['REDIS_SIZE'].nil? ? 1 : ENV['REDIS_SIZE'].to_i
url  = ENV['REDIS_URL'].nil? ? 'redis://localhost:6379/0' : ENV['REDIS_URL']

Sidekiq.configure_client do |config|
  config.redis = { :size => size, url: url }
end

require 'sidekiq/web'
require 'sidekiq/cron/web' if cron

if basic_auth
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end
end
run Rack::URLMap.new('/' => Sidekiq::Web)
