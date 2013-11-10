require_relative '../check'
require_relative '../utils/http_client'

module Wary
  module Check
    class HttpStatus
      include Wary::Check

      def initialize(options)
        @url = options.fetch(:url)
        @http_client = options.fetch(:http_client) { HTTPClient.new }
        configure(options)
      end

      def status
        begin
          response = @http_client.get_response(@url)
        rescue => e
          return failure("#{@url} down (#{e.message})")
        end

        if response.code == "200"
          ok(message(response))
        else
          alert("#{@url} (#{response.code} #{response.message})")
        end
      end

      private
      def message(response)
        "#{@url} (#{response.code} #{response.message})"
      end
    end
  end
end
