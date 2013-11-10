require 'spec_helper'
require 'wary/status'

describe Wary::Status::Alert do
  it_behaves_like 'a status', :alert
end
