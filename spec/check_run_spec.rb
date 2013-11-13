require 'spec_helper'
require 'wary/check_run'

describe Wary::CheckRun do
  let(:check) { double('Check', status: :ok) }
  let(:check_run) { Wary::CheckRun.new(check) }
  it 'runs the check only once' do
    check.should_receive(:status).once

    check_run.run
    check_run.run
  end

  it 'has the same name as the check' do
    check.stub(name: 'A name')
    expect(check_run.name).to eq check.name
  end

  context 'when the check already ran' do
    it 'returns the status of the check' do
      check_run.run
      expect(check_run.status).to eq check.status
    end
  end

  context 'when the check did not run' do
    it 'returns pending as a status' do
      expect(check_run.status).to eq :pending
    end
  end
end