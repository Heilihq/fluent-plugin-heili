require 'fluent/parser'

module Fluent
  class TextParser
    class HeiliParser < Parser
      Plugin.register_parser("heili", self)

      LONG_MAX = (2**62-1)
      LONG_MIN = LONG_MAX * -1

      def configure(conf)
        super

        require 'json'
      end

      def parse(text)
        log.debug("Metrics: #{text}")
        record = JSON.parse(text)
        time = record.dig('timestamp') || Engine.now
        log.debug("Metrics time: #{time}")
        unless record.key?("timestamp")
          record["timestamp"] = Engine.now
        end
        if record.key?("fields")
          record['fields'].each { |k,v|
            if (v.is_a? Integer) && (!v.between?(LONG_MIN, LONG_MAX))
              log.warn("Converting Bignum to string in #{k} key")
              record['fields'][k] = v.to_s
            end
          }
        end
        yield time, record
      end
    end
  end
end
