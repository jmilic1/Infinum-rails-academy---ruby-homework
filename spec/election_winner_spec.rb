RSpec.describe 'election winner', :election_winner do
  it 'finds winner from one vote list' do
    expect(election_winner(['Paula']))
      .to eq('Paula')
  end

  it 'finds winner from distinct list of votes' do
    expect(election_winner(['Harry', 'Anna', 'Paula', 'Anna']))
      .to eq('Anna')
  end

  it 'finds winner from duplicate list of votes' do
    expect(election_winner(['Paula', 'Harry', 'Harry', 'Paula', 'Anna']))
      .to eq('Paula')
  end
end
