require 'wary/status'
require 'wary/check'

module Wary
  module Check
    class LoadAverage
      include Wary::Check

      def initialize(load_meter, options)
        @load_meter = load_meter
        @alert_threshold = options.fetch(:alert_threshold)
      end

      def status
        begin
          load = @load_meter.load
        rescue => e
          return failure(e.message)
        end

        if load < @alert_threshold
          ok("Load #{load}")
        else
          alert("Load #{load} exceeds threshold (#{@alert_threshold})")
        end
      end
    end
  end
end

