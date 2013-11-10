require 'uri'
require 'net/http'

class HTTPClient
  def get_response(url)
    uri = URI(url)
    Net::HTTP.get_response(uri)
  end
end