module Wary
  module Status
    class Base
      attr_reader :message

      def initialize(message)
        @message = message
      end
      
      def ==(status_symbol)
        status_symbol == to_sym
      end

      def to_sym
        NotImplementedError
      end
    end

    class OK < Base
      def to_sym
        :ok
      end
    end

    class Alert < Base
      def to_sym
        :alert
      end
    end

    class Failure < Base
      def to_sym
        :failure
      end
    end
  end
end
