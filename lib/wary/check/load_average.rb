require_relative '../status'
require_relative '../check'
require_relative '../load_meter'

module Wary
  module Check
    class LoadAverage
      include Wary::Check

      def initialize(options)
        @load_meter = options.fetch(:load_meter) { Wary::LoadMeter.new }
        @alert_threshold = options.fetch(:alert_threshold)
        configure(options)
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

