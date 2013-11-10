require 'spec_helper'
require 'wary/check/http_status'
describe Wary::Check::HttpStatus do
  it_behaves_like 'a check'

  let(:url) { 'http://example.com' }
  let(:http_response) { double('Response') }
  let(:http_client) { double('Client', get_response: http_response)}
  let(:options) {{ url: url, http_client: http_client}}
  let(:check) { Wary::Check::HttpStatus.new(options) }

  context 'for the expected HTTP-Code' do
    it 'signals OK' do
      http_response.stub(code: '200', message: 'OK')
      expect(status).to eq(:ok)
      expect(status.message).to eq "#{url} (200 OK)"
    end
  end

  context 'for an unexpected HTTP-Code' do
    it 'signals alert' do
      http_response.stub(code: '302', message: 'Found')
      expect(status).to eq(:alert)
      expect(status.message).to eq "#{url} (302 Found)"
    end
  end

  context 'when something else is wrong' do
    it 'signals failure' do
      http_client.stub(:get_response).and_throw StandardError
      expect(status).to eq(:failure)
      expect(status.message).to match /#{url} down/
    end
  end

  def status
    check.status
  end
end