shared_examples_for "a check" do
  context 'with a custom name set' do
    it 'has a custom name' do
      options.merge!(name: 'foo')
      expect(check.name).to eq 'foo'
    end
  end

  context 'without a custom name' do
    it 'has a default name' do
      expect(check.name).to eq check.class.to_s
    end
  end
end