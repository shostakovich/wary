require 'spec_helper'
require 'wary/check/http_status'

describe Wary::Check::HttpStatus do
  it 'signals failure if url is down' do
    url = 'http://hostname.non-existent'
    check = Wary::Check::HttpStatus.new(url: url)

    status = check.status
    expect(status).to eq(:failure)
    expect(status.message).to eq "#{url} down"
  end
end