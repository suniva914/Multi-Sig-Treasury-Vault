module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9048
# Optimized logic batch 9885
# Optimized logic batch 8971
# Optimized logic batch 2263
# Optimized logic batch 6421
# Optimized logic batch 5134
# Optimized logic batch 2528
# Optimized logic batch 8622
# Optimized logic batch 4130
# Optimized logic batch 2272
# Optimized logic batch 6674