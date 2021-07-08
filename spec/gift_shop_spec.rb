RSpec.describe 'gift shop', :gift_shop do
  describe Item, :gift_shop do
    it 'returns own weight' do
      item = described_class.new(weight: 100)

      expect(item.total_weight).to eq(100)
    end

    it 'returns total weight' do
      item = described_class.new(weight: 100, quantity: 3)

      expect(item.total_weight).to eq(300)
    end
  end

  describe Box, :gift_shop do
    it 'inherits from Item' do
      expect(described_class.superclass).to be(Item)
    end

    it 'returns own weight when empty' do
      box = described_class.new(weight: 100, items: [])

      expect(box.total_weight).to eq(100)
    end

    it 'adds weight of all containing items' do
      box = described_class.new(weight: 100, items: [Item.new(weight: 300, quantity: 2),
                                                     Item.new(weight: 200, quantity: 4)])
      expect(box.total_weight).to eq(1_500)
    end

    context 'when contains other boxes' do
      it 'adds weight of all containing boxes' do # rubocop:disable RSpec/ExampleLength
        box = described_class.new(
          weight: 100,
          items: [
            Item.new(weight: 250, quantity: 2),
            described_class.new(weight: 50, items: [Item.new(weight: 100, quantity: 3)]),
            described_class.new(weight: 50,
                                items: [described_class.new(
                                  weight: 20, items: [Item.new(weight: 30)]
                                )])
          ]
        )

        expect(box.total_weight).to eq(1_050)
      end
    end
  end
end
