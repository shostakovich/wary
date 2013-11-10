require 'yaml'

require_relative'wary/version'
require_relative 'wary/suite_builder'

module Wary
  def self.run
    configuration = YAML.load_file(ENV['CONFIG'])
    check_suite = SuiteBuilder.new(configuration).build

    puts "Check Suite status #{check_suite.status}"
    check_suite.checks.each do |check|
      puts "#{check.class}: [#{check.status.to_sym}] #{check.status.message}"
    end
  end
end

Wary.run
