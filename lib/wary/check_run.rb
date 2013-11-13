module Wary
  class CheckRun
    def initialize(check)
      @check = check
    end

    def run
      @status ||= @check.status
    end

    def name
      @check.name
    end

    def status
      @status || :pending
    end
  end
end