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
    expect(PokerHand.check_pair(["K", "T", "8", "5", "2"])).to eq (false)
  end
  it '6. checking if pair method works (should return [pair, kickers array])' do
    expect(PokerHand.check_pair(["K", "T", "5", "2", "2"])).to eq (["2", ["K", "T", "5"]])
  end
  it '7. checking if pair method works with 2 pairs(should return false' do
    expect(PokerHand.check_pair(["K", "T", "K", "2", "2"])).to eq (false)
  end
  it '8. checking 2 pairs method works with no 2 pairs' do
    expect(PokerHand.check_2pairs(["K", "T", "5", "2", "2"])).to eq (false)
  end
  it '9. checking if 2 pairs method (should return [pairs, kickers array])' do
    expect(PokerHand.check_2pairs(["K", "T", "T", "2", "2"])).to eq ([["T", "2"], ["K"]])
  end
  it '10. checking if pair method works for 2 pairs (should return [pairs, kickers array])' do
    expect(PokerHand.check_2pairs(["K", "K", "J", "2", "2"])).to eq ([["K", "2"], ["J"]])
  end
  it '11. checking if three_of_a_kind method works for false (should return false)' do
    expect(PokerHand.check_three_of_a_kind(["K", "K", "J", "2", "2"])).to eq (false)
  end
  it '12. checking if three_of_a_kind method works for true case' do
    expect(PokerHand.check_three_of_a_kind(["K", "K", "J", "K", "2"])).to eq (["K",["J", "2"]])
  end
  it '13. checking if three_of_a_kind method works for Full House case' do
    expect(PokerHand.check_three_of_a_kind(["K", "K", "J", "K", "J"])).to eq (["K",["J", "J"]])
  end
  it '14. checking if straight method works' do
    expect(PokerHand.check_straight(["J", "T", "9", "8", "7"])).to eq([true, "J"])
  end
  it '15. checking if straight method works' do
    expect(PokerHand.check_straight(["A", "T", "9", "8", "7"])).to eq(false)
  end
  it '16. checking if straight method works' do
    expect(PokerHand.check_straight(["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '17. checking if flush method works' do
    expect(PokerHand.check_flush(["H", "H", "H", "H", "H"],["J", "T", "9", "8", "6"])).to eq([true, "J"])
  end
  it '18. checking if flush method works' do
    expect(PokerHand.check_flush(["H", "H", "H", "D", "H"],["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '19. checking if flush method works' do
    expect(PokerHand.check_flush(["D", "H", "H", "H", "H"],["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '20. checking if flush method works' do
    expect(PokerHand.check_flush(["H", "H", "H", "H", "D"],["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '21. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "A", "K", "K"])).to eq(["A", "K"])
  end
  it '22. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "A", "K", "Q"])).to eq(false)
  end
  it '23. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "K", "K", "K"])).to eq(["K", "A"])
  end
  it '24. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "K", "K", "Q"])).to eq(false)
  end
end















# delete this line on completion
