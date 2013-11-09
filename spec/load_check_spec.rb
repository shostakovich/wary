require 'spec_helper'
require 'wary/load_average_check'

describe Wary::LoadAverageCheck do
  let(:threshold) { 2.00 }
  let(:check) { Wary::LoadAverageCheck.new(load_meter, :alert_threshold => threshold) }

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
end
