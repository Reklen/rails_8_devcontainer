require "redis"

redis_url = ENV.fetch("REDIS_URL") { "redis://redis:6379/1" }

$redis = Redis.new(url: redis_url)

# Optional error handling
begin
  $redis.ping
rescue Redis::CannotConnectError => error
  Rails.logger.error "Failed to connect to Redis: #{error.message}"
end
