require 'spec_helper'
require 'wary/load_meter'

describe Wary::LoadMeter do
  let(:shell) { double('Shell', execute: 'load averages: 1,25 1,22 1,19') }

  it 'execute the load command' do
    shell.should_receive(:execute).with('w h')

    measure_load
  end

  it 'extracts the 1 min load' do
    shell.stub(execute: 'load averages: 1,25 1,22 1,19')
    expect(measure_load).to eq(1.25)
  end

  it 'throws an error if load not measurable' do
    shell.stub(execute: 'Take this..')
    expect { measure_load }.to raise_error(Wary::LoadMeter::MeasurementFailed)
  end

  def measure_load
    Wary::LoadMeter.new(shell).load
  end
end
