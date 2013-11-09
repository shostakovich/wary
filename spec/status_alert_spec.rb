require 'spec_helper'
require 'wary/status'

describe Wary::Status::Alert do
  let(:message) { 'Foobar' }
  let(:status) { Wary::Status::Alert.new(message) }

  it 'has failed' do
    expect(status).to eq(:alert)
  end

  it 'has a message' do
    expect(status.message).to eq message
  end
end
