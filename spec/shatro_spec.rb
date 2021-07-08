RSpec.describe 'shatro', :shatro do
  it 'mangles input' do
    expect(shatro('rodio se u maloj kuci')).to eq('dioro se u lojma ciku')
    expect(shatro('nemoj ga ni nista pitat')).to eq('mojne ga ni stani tatpi')
    expect(shatro('gatsby hlace i krunicu')).to eq('tsbyga cehla i nicukru')
    expect(shatro('gramofona ima sedam')).to eq('mofonagra mai damse')
    expect(shatro('niko nista da ne zucne')).to eq('koni stani da ne cnezu')
  end
end
