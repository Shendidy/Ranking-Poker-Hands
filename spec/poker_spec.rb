require 'poker'

describe 'Poker' do
  it 'checking array of cards in hand' do # testing that the cards are split into an array correctly
    expect(PokerHand.hand("KS 2H 5C JD TD")).to eq(["KS", "2H", "5C", "JD", "TD"])
  end
  it 'checking total points in hand before setting best combination' do
    expect(PokerHand.total("KS 2H 5C JD TD")).to eq(41)
  end
end
