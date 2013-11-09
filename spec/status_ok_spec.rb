require 'spec_helper'
require 'wary/status/ok'

describe Wary::Status::OK do
  let(:message) { 'Foobar' }
  let(:status) { Wary::Status::OK.new(message) }

  it 'is ok' do
    expect(status).to eq(:ok)
  end

  it 'has a message' do
    expect(status.message).to eq message
  end
end
