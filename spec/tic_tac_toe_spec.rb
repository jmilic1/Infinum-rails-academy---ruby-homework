RSpec.describe 'tic tac toe', :tic_tac_toe do
  it 'checks if upper horizontal is winning' do
    expect(tic_tac_toe([
                         ['X', 'X', 'X'],
                         [nil, 'O', 'O'],
                         ['O', 'X', 'O']
                       ])).to eq('X')
  end

  it 'checks if middle horizontal is winning' do
    expect(tic_tac_toe([
                         ['X', nil, 'X'],
                         ['O', 'O', 'O'],
                         [nil, 'X', 'O']
                       ])).to eq('O')
  end

  it 'checks if lower horizontal is winning' do
    expect(tic_tac_toe([
                         ['X', nil, 'X'],
                         ['O', 'X', 'O'],
                         ['O', 'O', 'O']
                       ])).to eq('O')
  end

  it 'checks if left vertical is winning' do
    expect(tic_tac_toe([
                         ['O', nil, 'X'],
                         ['O', 'X', 'O'],
                         ['O', 'X', 'O']
                       ])).to eq('O')
  end

  it 'checks if middle vertical is winning' do
    expect(tic_tac_toe([
                         ['O', 'X', nil],
                         [nil, 'X', 'O'],
                         ['O', 'X', nil]
                       ])).to eq('X')
  end

  it 'checks if right horizontal is winning' do
    expect(tic_tac_toe([
                         ['O', nil, 'O'],
                         ['X', 'X', 'O'],
                         ['O', 'X', 'O']
                       ])).to eq('O')
  end

  it 'checks NW-SE diagonal is winning' do
    expect(tic_tac_toe([
                         ['O', nil, 'O'],
                         ['X', 'O', 'X'],
                         ['O', 'X', 'O']
                       ])).to eq('O')
  end

  it 'checks NE-SW diagonal is winning' do
    expect(tic_tac_toe([
                         ['X', 'O', 'O'],
                         ['X', 'O', 'X'],
                         ['O', 'X', 'O']
                       ])).to eq('O')
  end

  it 'checks if board is a draw' do
    expect(tic_tac_toe([
                         ['X', 'O', 'O'],
                         ['O', 'X', 'X'],
                         ['O', 'X', 'O']
                       ])).to eq('D')
  end
end
