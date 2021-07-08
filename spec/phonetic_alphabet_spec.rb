RSpec.describe 'spell', :phonetic_alphabet do
  it 'converts word to series phonetic codes' do
    expect(spell('snake')).to eq('Sierra November Alfa Kilo Echo')
    expect(spell('ham')).to eq('Hotel Alfa Mike')
    expect(spell('jerry')).to eq('Juliett Echo Romeo Romeo Yankee')
    expect(spell('snow')).to eq('Sierra November Oscar Whiskey')
  end
end
