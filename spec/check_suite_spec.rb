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
    let(:checks) { [make_check(status: :ok)] }

    it 'runs all the checks only once' do
      checks.each do |check|
        check.should_receive(:status).once
      end
      suite.status
      suite.status
    end

    it 'is not empty' do
      expect(suite).to_not be_empty
    end

    context 'when all checks are ok' do
      it 'has the status OK' do
        checks << make_check(status: :ok)
        expect(suite.status).to eq(:ok)
      end
    end

    context 'when one ore more checks are in an alert state' do
      it 'has the status ALERT' do
        checks << make_check(status: :alert)
        expect(suite.status).to eq(:alert)
      end
    end

    context 'when one ore more checks are in a failure state' do
      it 'has the status ALERT' do
        checks << make_check(status: :failure)
        expect(suite.status).to eq(:alert)
      end
    end
  end

  def make_check(stubs = {})
    check = double('Check', stubs).as_null_object
    check
  end
end
