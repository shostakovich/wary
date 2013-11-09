describe Wary::LoadMeter do
  it 'execute the load command' do
    shell = double('Shell').should_receive(execute: 'w h')
    Wary::LoadMeter.new(shell).load
  end
end
