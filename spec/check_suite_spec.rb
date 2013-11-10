require 'spec_helper'
require 'wary/check_suite'

describe Wary::CheckSuite do
  let(:suite) { Wary::CheckSuite.new(checks) }

  context 'for an empty list' do
    let(:checks) { Array.new }
    
    it 'is empty' do
      expect(suite).to be_empty
    end

    it 'has the status OK if no checks are set' do
      expect(suite.status).to eq(:ok)
    end
  end

  context 'for a filled list' do
    let(:checks) { [make_check] }

    it 'is not empty' do
      checks << double('Check')
      expect(suite).to_not be_empty
    end

    it 'has the status ALERT if one ore more checks failed' do
      checks << make_check(status: :alert)
      expect(suite.status).to eq(:alert)
    end
  end

  def make_check(stubs = {})
    check = double('Check', stubs).as_null_object
    check
  end
end
