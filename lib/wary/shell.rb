# Pray to god that this works
module Wary
  class Shell
    def execute(command)
      `#{command}`
    end
  end
end
