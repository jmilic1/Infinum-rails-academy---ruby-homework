RSpec.describe 'open class', :open_class do
  describe 'Integer#increment', :open_class_integer do
    it 'is defined on Integer class' do
      expect(Integer.instance_methods).to include(:increment)
    end

    it 'increments by one' do
      expect(1.increment).to eq(2)
      expect(2.increment).to eq(3)
      expect(500.increment).to eq(501)
    end
  end

  describe 'String#ascii_sum', :open_class_string do
    it 'is defined on String class' do
      expect(String.instance_methods).to include(:ascii_sum)
    end

    it 'sums decimal ASCII codes of each character' do
      expect('abc'.ascii_sum).to eq(294)
      expect("\n".ascii_sum).to eq(10)
      expect('\n'.ascii_sum).to eq(202)
      expect('  '.ascii_sum).to eq(64)
      expect('012'.ascii_sum).to eq(147)
    end
  end

  describe 'Array#second', :open_class_array do
    it 'is defined on Array class' do
      expect(Array.instance_methods).to include(:second)
    end

    it 'fetches second element in the array' do
      expect([].second).to be_nil
      expect([1].second).to be_nil
      expect([1, 2, 3].second).to eq(2)
    end
  end
end
