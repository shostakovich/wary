require_relative 'check_run'

module Wary
  class CheckSuite
    attr_reader :checks

    def initialize(checks)
      @checks = run_all(checks)
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

    private
    def run_all(checks)
      checks.map do |c|
        check = Wary::CheckRun.new(c)
        check.run
        check
      end
    end
  end
end

