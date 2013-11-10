require 'wary/check'

module Wary
  module Check
    class HttpStatus
      include Wary::Check

      def initialize(options)
        @url = options.fetch(:url)
      end

      def status
        failure("#{@url} down")
      end
    end
  end
end
