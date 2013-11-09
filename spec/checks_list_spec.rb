require 'spec_helper'
require 'wary/status_report'

describe Wary::StatusReport do
  let(:checks_list) { Wary::StatusReport.new(checks) }

  context 'for an empty list' do
    let(:checks) { Array.new }
    
    it 'is empty' do
      expect(checks_list).to be_empty
    end

    it 'has the status OK if no checks are set' do
      expect(checks_list.status).to eq(:ok)
    end
  end

  context 'for a filled list' do
    let(:checks) { [make_check] }

    it 'is not empty' do
      checks << double('Check')
      expect(checks_list).to_not be_empty
    end

    it 'has the status ALERT if one ore more checks failed' do
      checks << make_check(status: :alert)
      expect(checks_list.status).to eq(:alert)
    end
  end

  def make_check(stubs = {})
    check = double('Check', stubs).as_null_object
    check
  end
end
