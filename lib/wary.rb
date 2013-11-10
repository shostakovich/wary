require 'yaml'

require_relative'wary/version'
require_relative 'wary/suite_builder'

module Wary
  def self.run
    configuration = YAML.load_file(ENV['CONFIG'])
    puts SuiteBuilder.new(configuration).build.status
  end
end

Wary.run
