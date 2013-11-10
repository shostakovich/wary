require 'spec_helper'
require 'wary/status'

describe Wary::Status::OK do
  it_behaves_like 'a status', :ok
end
