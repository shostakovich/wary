require 'spec_helper'
require 'wary/status'

describe Wary::Status::Failure do
  it_behaves_like 'a status', :failure
end