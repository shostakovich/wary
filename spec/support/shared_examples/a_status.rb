shared_examples_for "a status" do |status_symbol|
  let(:message) { "Info" }
  let(:status) { described_class.new(message) }

  it 'has a message' do
    expect(status.message).to eq message
  end

  it "is #{status_symbol}" do
    expect(status).to eq(status_symbol)
  end
end