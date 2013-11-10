# Pray to god that this works
module Wary
  module Utils
    class Shell
      def execute(command)
        `#{command}`
      end
    end
  end
end
