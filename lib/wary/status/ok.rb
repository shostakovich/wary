module Wary
  module Status
    class OK
      attr_reader :message

      def initialize(message)
        @message = message
      end

      def ==(status_symbol)
        :ok == status_symbol
      end
    end
  end
end
