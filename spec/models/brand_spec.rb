RSpec.describe Brand do
  describe '#initialize' do
    it 'exists and has attributes' do
      brand = Brand.new

      expect(brand).to eq(Brand)
    end
  end
end
