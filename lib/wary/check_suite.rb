module Wary
  class CheckSuite
    attr_reader :checks

    def initialize(checks)
      @checks = checks
    end

    def empty?
      checks.empty?
    end

    def status
      if checks.any? { |c| c.status != :ok }
        :alert
      else
        :ok
      end
    end
  end
end

