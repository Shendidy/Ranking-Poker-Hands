require 'poker'

describe 'Poker' do
  it '1. checking array of cards in hand' do
    expect(PokerHand.hand("KS 2H 5C JD TD")).to eq(["KS", "JD", "TD", "5C", "2H"])
  end
  it '2. Sorting hand in descending order' do
    expect(PokerHand.sort_hand(["KS", "2H", "5C", "JD", "TD"])).to eq(["KS", "JD", "TD", "5C", "2H"])
  end
  it '3. checking array of cards in hand' do
    expect(PokerHand.hand("KS 2H KC JD 2D")).to eq(["KS", "KC", "JD", "2H", "2D"])
  end
  it '4. checking total points in hand before setting best combination' do
    expect(PokerHand.total(["K", "2", "5", "Q", "T"])).to eq(42)
  end
  it '5. checking if pair method works (should return [false, kickers array])' do
    expect(PokerHand.check_pairs(["K", "T", "8", "5", "2"])).to eq ([false, ["K", "T", "8", "5", "2"]])
  end
  it '6. checking if pair method works (should return [pair, kickers array])' do
    expect(PokerHand.check_pairs(["K", "T", "5", "2", "2"])).to eq ([["2"], ["K", "T", "5"]])
  end
  it '7. checking if pair method works for 2 pairs (should return [pairs, kickers array])' do
    expect(PokerHand.check_pairs(["K", "T", "T", "2", "2"])).to eq ([["T", "2"], ["K"]])
  end
  it '8. checking if pair method works for 2 pairs (should return [pairs, kickers array])' do
    expect(PokerHand.check_pairs(["K", "K", "J", "2", "2"])).to eq ([["K", "2"], ["J"]])
  end
end
