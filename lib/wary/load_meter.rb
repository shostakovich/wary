module Wary
  class LoadMeter
    class MeasurementFailed < StandardError; end

    def initialize(shell)
      @shell = shell
    end

    def load
      raw_load_avg_last_min.sub(',', '.').to_f
    end

    private
    def raw_load_avg_last_min
      matches = raw_data.match(/load averages\: ([0-9,\.]+)/)
      if matches
        matches[1]
      else
        raise Wary::LoadMeter::MeasurementFailed, "Could no extract load average from '#{raw_data}'"
      end
    end

    def raw_data
      String(@shell.execute('w h'))
    end
  end
end

