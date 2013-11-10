require_relative 'check'
require_relative 'check_suite'

class Wary::SuiteBuilder
  def initialize(configuration)
    @checks = configuration.fetch(:checks) || []
  end

  def build
    initialized_checks = @checks.map do |name, config|
      Kernel.const_get("Wary::Check::#{name}").new(config)
    end

    Wary::CheckSuite.new(initialized_checks)
  end
end