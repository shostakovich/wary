module Wary
  class CheckSuite
    def initialize(checks)
      @checks = checks
    end

    def empty?
      @checks.empty?
    end

    def status
      if @checks.any? { |c| c.status == :alert }
        :alert
      else
        :ok
      end
    end
  end
end
