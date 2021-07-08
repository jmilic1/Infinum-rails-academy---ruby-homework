RSpec.describe 'holes', :holes do
  it 'counts holes for digit 0' do
    expect(holes(0)).to eq(1)
  end

  it 'counts holes for digit 1' do
    expect(holes(1)).to eq(0)
  end

  it 'counts holes for digit 2' do
    expect(holes(2)).to eq(0)
  end

  it 'counts holes for digit 3' do
    expect(holes(3)).to eq(0)
  end

  it 'counts holes for digit 4' do
    expect(holes(4)).to eq(1)
  end

  it 'counts holes for digit 5' do
    expect(holes(5)).to eq(0)
  end

  it 'counts holes for digit 6' do
    expect(holes(6)).to eq(1)
  end

  it 'counts holes for digit 7' do
    expect(holes(7)).to eq(0)
  end

  it 'counts holes for digit 8' do
    expect(holes(8)).to eq(2)
  end

  it 'counts holes for digit 9' do
    expect(holes(9)).to eq(1)
  end

  it 'counts holes for 1234567890' do
    expect(holes(1_234_567_890)).to eq(6)
  end

  it 'counts holes for 10492' do
    expect(holes(10_492)).to eq(3)
  end
end
