require 'spec_helper'
require 'wary/check/load_average'

describe Wary::Check::LoadAverage do
  let(:threshold) { 2.00 }
  let(:check) { Wary::Check::LoadAverage.new(load_meter, :alert_threshold => threshold) }
  
  context 'when the load is below the threshold' do
    let(:load_meter) { double('LoadMeter', load: threshold - 0.01) }
    
    it 'has the status :ok' do
      expect(check.status).to eq(:ok)
    end
  end

  context 'when the load is on or above the threshold' do
    let(:load_meter) { double('LoadMeter', load: threshold) }
    
    it 'has the status :alert' do
      expect(check.status).to eq(:alert)
    end
  end

  context 'when measuring the load failed' do
    let(:load_meter) do
      loadmeter = double('LoadMeter')
      loadmeter.stub(:load).and_throw(StandardError)
      loadmeter
    end

    it 'has the status :failure' do
      expect(check.status).to eq(:failure)
    end
  end
end
