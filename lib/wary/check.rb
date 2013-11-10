module Wary
  module Check
    private
    def ok(message)
      Status::OK.new(message)
    end

    def alert(message)
      Status::Alert.new(message)
    end

    def failure(message)
      Status::Failure.new(message)
    end
  end
end
