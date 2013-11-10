require_relative 'check/load_average'
require_relative 'check/http_status'

module Wary
  module Check
    attr_reader :name

    def configure(options)
      @name = options.fetch(:name) { self.class.to_s }
    end

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
