require 'wary/status/ok'

module Wary
  class LoadAverageCheck
    def initialize(load_meter, options)
      @load_meter = load_meter
      @alert_threshold = options.fetch(:alert_threshold)
    end

    def status
      load = @load_meter.load

      if load < @alert_threshold
        Status::OK.new("Load #{load} < #{@alert_threshold}")
      else
        :alert
      end
    end
  end
end

