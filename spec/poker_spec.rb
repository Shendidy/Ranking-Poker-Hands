require 'poker'

describe 'Poker' do
  it 'checking array of cards in hand' do
    expect(PokerHand.hand("KS 2H 5C JD TD")).to eq(["KS", "2H", "5C", "JD", "TD"])
  end
  it 'Sorting hand in descending order' do
    expect(PokerHand.sort_hand(["KS", "2H", "5C", "JD", "TD"])).to eq(["KS", "JD", "TD", "5C", "2H"])
  end
  it 'checking total points in hand before setting best combination' do
    expect(PokerHand.total(["K", "2", "5", "Q", "T"])).to eq(42)
  end
  it 'checking if pair method works (should return [false, kickers array])' do
    expect(PokerHand.check_pair(["K", "T", "8", "5", "2"])).to eq ([false, ["K", "T", "8", "5", "2"]])
  end
  it 'checking if pair method works (should return [true, kickers array])' do
    expect(PokerHand.check_pair(["K", "2", "5", "2", "T"])).to eq (["2", ["K", "T", "5"]])
  end
end
