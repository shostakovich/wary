require 'yaml'
require 'terminal-table'

require_relative'wary/version'
require_relative 'wary/suite_builder'

module Wary
  def self.run
    configuration = YAML.load_file(ENV['CONFIG'])
    check_suite = SuiteBuilder.new(configuration).build

    title = "Overall Check Suite Status (#{check_suite.status})"

    headings = ['Name', 'Status', 'Message']
    rows = check_suite.checks.map do |check|
      [check.name, check.status.to_sym, check.status.message]
    end

    table = Terminal::Table.new(headings: headings, rows: rows, title: title)
    table.align_column(1, :center)
    puts table
  end
end

Wary.run
