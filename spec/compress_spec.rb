RSpec.describe 'compress', :compress do
  it 'encodes empty input stream' do
    expect(compress('')).to eq('')
  end

  it 'encodes single character' do
    expect(compress('a')).to eq('1a')
  end

  it 'encodes multiple characters' do
    expect(compress('aa')).to eq('2a')
    expect(compress('aabb')).to eq('2a2b')
    expect(compress('abbccc')).to eq('1a2b3c')
    expect(compress('1223334444')).to eq('11223344')
    expect(compress('4332221111')).to eq('14233241')
  end
end
