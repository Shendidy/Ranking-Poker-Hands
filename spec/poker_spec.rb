require 'poker'

describe 'Poker' do
  it 'checking array of cards in hand' do # testing that the cards are split into an array correctly
    expect(PokerHand.hand("KS 2H 5C JD TD")).to eq(["KS", "2H", "5C", "JD", "TD"])
  end
  it 'checking total points in hand before setting best combination' do
    expect(PokerHand.total(["K", "2", "5", "Q", "T"])).to eq(42)
  end
  it 'checking if pair method works (should return @p = [true, kicker])' do
    expect(PokerHand.check_pair(["K", "T", "8", "5", "2"])).to eq ([false, ["K", "T", "8", "5", "2"]])
  end
  it 'checking if pair method works (should return @p = [true, kicker])' do
    expect(PokerHand.check_pair(["K", "2", "5", "2", "T"])).to eq (["2", ["K", "T", "5"]])
  end
end
