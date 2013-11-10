require 'spec_helper'
require 'wary/check/http_status'

describe Wary::Check::HttpStatus do
  let(:url) { 'http://example.com' }
  let(:http_response) { double('Response') }
  let(:http_client) { double('Client', get_response: http_response)}

  context 'for the expected HTTP-Code' do
    it 'signals OK' do
      http_response.stub(code: '200', message: 'OK')
      expect(status_for_url(url)).to eq(:ok)
      expect(status_for_url(url).message).to eq "#{url} (200 OK)"
    end
  end

  context 'for an unexpected HTTP-Code' do
    it 'signals alert' do
      http_response.stub(code: '302', message: 'Found')
      expect(status_for_url(url)).to eq(:alert)
      expect(status_for_url(url).message).to eq "#{url} (302 Found)"
    end
  end

  context 'when something else is wrong' do
    it 'signals failure' do
      http_client.stub(:get_response).and_throw StandardError
      expect(status_for_url(url)).to eq(:failure)
      expect(status_for_url(url).message).to match /#{url} down/
    end
  end

  def status_for_url(url)
    check = Wary::Check::HttpStatus.new(url: url, http_client: http_client)
    check.status
  end
end