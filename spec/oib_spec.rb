RSpec.describe Oib, :oib do
  it 'raises error for too short codes' do
    expect { described_class.new('') }.to raise_error(ArgumentError, 'Code is too short')
    expect { described_class.new('123') }.to raise_error(ArgumentError, 'Code is too short')
    expect { described_class.new('1234567890') }.to raise_error(ArgumentError, 'Code is too short')
  end

  it 'raises error for too long codes' do
    expect { described_class.new('123456789012') }
      .to raise_error(ArgumentError, 'Code is too long')
    expect { described_class.new('1234567890123') }
      .to raise_error(ArgumentError, 'Code is too long')
    expect { described_class.new('1234567890124') }
      .to raise_error(ArgumentError, 'Code is too long')
  end

  it 'raises error for codes which contain alphabet characters' do
    expect { described_class.new('a1234567890') }
      .to raise_error(ArgumentError, 'Code should contain only digits')
  end

  it 'raises error for codes which contain special characters' do
    expect { described_class.new('*1234567890') }
      .to raise_error(ArgumentError, 'Code should contain only digits')
  end

  describe '#valid?' do
    it 'succedes for valid codes' do
      expect(described_class.new('12345678903')).to be_valid
      expect(described_class.new('93320951366')).to be_valid
      expect(described_class.new('91117038468')).to be_valid
      expect(described_class.new('74306252866')).to be_valid
      expect(described_class.new('40352592970')).to be_valid
    end

    it 'fails for invalid codes' do
      expect(described_class.new('16358720679')).not_to be_valid
      expect(described_class.new('81205408966')).not_to be_valid
      expect(described_class.new('99031729198')).not_to be_valid
      expect(described_class.new('83400401200')).not_to be_valid
      expect(described_class.new('59540018639')).not_to be_valid
    end
  end
end
