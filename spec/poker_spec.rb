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
    expect(PokerHand.check_2pairs(["K", "T", "T", "2", "2"])).to eq (true)
  end
  it '10. checking if pair method works for 2 pairs (should return [pairs, kickers array])' do
    expect(PokerHand.check_2pairs(["K", "K", "J", "2", "2"])).to eq (true)
  end
  it '11. checking if three_of_a_kind method works for false (should return false)' do
    expect(PokerHand.check_three_of_a_kind(["K", "K", "J", "2", "2"])).to eq (false)
  end
  it '12. checking if three_of_a_kind method works for true case' do
    expect(PokerHand.check_three_of_a_kind(["K", "K", "J", "K", "2"])).to eq (true)
  end
  it '13. checking if three_of_a_kind method works for Full House case' do
    expect(PokerHand.check_three_of_a_kind(["K", "9", "9", "9", "5"])).to eq (true)
  end
  it '14. checking if straight method works' do
    expect(PokerHand.check_straight(["J", "T", "9", "8", "7"])).to eq(true)
  end
  it '15. checking if straight method works' do
    expect(PokerHand.check_straight(["A", "T", "9", "8", "7"])).to eq(false)
  end
  it '16. checking if straight method works' do
    expect(PokerHand.check_straight(["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '17. checking if flush method works' do
    expect(PokerHand.check_flush(["H", "H", "H", "H", "H"],["J", "T", "9", "8", "6"])).to eq(true)
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
    expect(PokerHand.check_full_house(["A", "A", "A", "K", "K"])).to eq(true)
  end
  it '22. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "A", "K", "Q"])).to eq(false)
  end
  it '23. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "K", "K", "K"])).to eq(true)
  end
  it '24. checking if full house method works' do
    expect(PokerHand.check_full_house(["A", "A", "K", "K", "Q"])).to eq(false)
  end
  it '25. checking if four_of_a_kind method works for false (should return false)' do
    expect(PokerHand.check_four_of_a_kind(["K", "K", "K", "2", "2"])).to eq (false)
  end
  it '26. checking if four_of_a_kind method works for false (should return false)' do
    expect(PokerHand.check_four_of_a_kind(["K", "2", "2", "2", "2"])).to eq (true)
  end
  it '27. checking if four_of_a_kind method works for false (should return false)' do
    expect(PokerHand.check_four_of_a_kind(["K", "K", "K", "K", "2"])).to eq (true)
  end
  it '28. checking if straight flush method works' do
    expect(PokerHand.check_straight_flush(["H", "H", "H", "H", "H"],["J", "T", "9", "8", "6"])).to eq(false)
  end
  it '29. checking if straight flush method works' do
    expect(PokerHand.check_straight_flush(["D", "H", "H", "H", "H"],["J", "T", "9", "8", "7"])).to eq(false)
  end
  it '30. checking if straight flush method works' do
    expect(PokerHand.check_straight_flush(["H", "H", "H", "H", "H"],["J", "T", "9", "8", "7"])).to eq(true)
  end
  it '31. checking if royal flush method works' do
    expect(PokerHand.check_royal_flush(["H", "H", "H", "H", "H"],["Q", "T", "9", "8", "7"])).to eq(false)
  end
  it '32. checking if royal flush method works' do
    expect(PokerHand.check_royal_flush(["H", "H", "H", "H", "H"],["J", "T", "9", "8", "7"])).to eq(false)
  end
  it '33. checking if royal flush method works' do
    expect(PokerHand.check_royal_flush(["H", "H", "H", "H", "H"],["A", "K", "Q", "J", "T"])).to eq(true)
  end
  it '34. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "H", "H", "H", "H"],["A", "K", "Q", "J", "T"])).to eq(["Royal Flush"])
  end
  it '35. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "H", "H", "H", "H"],["K", "Q", "J", "T", "9"])).to eq(["Straight Flush", "K"])
  end
  it '36. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "S", "C", "D", "S"],["K", "K", "K", "K", "2"])).to eq(["Four of a Kind", "K", "2"])
  end
  it '37. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "S", "C", "D", "S"],["K", "K", "K", "2", "2"])).to eq(["Full House", "K", "2"])
  end
  it '38. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "H", "H", "H", "H"],["K", "T", "7", "6", "2"])).to eq(["Flush", ["K", "T", "7", "6", "2"]])
  end
  it '39. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "C", "H", "D", "S"],["9", "8", "7", "6", "5"])).to eq(["Straight", "9"])
  end
  it '40. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "C", "H", "D", "S"],["T", "9", "9", "9", "5"])).to eq(["Three of a kind", "9", ["T", "5"]])
  end
  it '41. checking if best hand rank method works' do
    expect(PokerHand.best_hand_rank(["H", "C", "H", "D", "S"],["T", "T", "9", "9", "5"])).to eq(["Two pairs", "T", "9", "5"])
  end
end















# delete this line on completion
