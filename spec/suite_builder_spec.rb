require 'spec_helper'
require 'wary/suite_builder'

describe Wary::SuiteBuilder do
  context 'for an empty list of checks' do
    let(:configuration) { {:checks => nil} }

    it 'builds an empty suite' do
      expect(Wary::SuiteBuilder.new(configuration).build).to be_empty
    end
  end

  context 'for one configured check' do
    let(:configuration) do
      { checks: {'LoadAverage' => { alert_threshold: 2.0 } } }
    end

    it 'builds a suite with one check' do
      expect(Wary::SuiteBuilder.new(configuration).build).to_not be_empty
    end
  end
end