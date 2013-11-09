module Wary
  class LoadAverageCheck
    def initialize(load_meter, options)
      @load_meter = load_meter
      @alert_threshold = options.fetch(:alert_threshold)
    end

    def status
      if @load_meter.load < @alert_threshold
        :ok
      else
        :alert
      end
    end
  end
end

