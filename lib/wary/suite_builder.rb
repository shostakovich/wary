require_relative 'check'
require_relative 'check_suite'

class Wary::SuiteBuilder
  def initialize(configuration)
    @checks = configuration.fetch(:checks) || []
  end

  def build
    initialized_checks = @checks.map do |name, config|
      klass = config.fetch(:class)
      config[:name] = name
      constantize("Wary::Check::#{klass}").new(config)
    end

    Wary::CheckSuite.new(initialized_checks)
  end

  private
  def constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end
end