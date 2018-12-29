class PokerHand
  # 1. decide the hand's best case
    # method explained in the README.md file.
  # 3. do the same for the second hand
  # 4. compare both hands and return result ("Win", "Tie", "Loss")

  @total = 0



  # 1.
    # Read hand string
  def self.hand(hand)
    @cards1 = hand.split(" ")
  end

  # Calculate hand total points before adding value of best hand combination
  def self.total (cards = @cards1)
    card_value = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}

    @cards1.each do |card|
      @total += card_value[card[0]]
    end
    @total
  end

  def self.best_hand
    # Royal Flush
    # Straight Flush
    # 4 of a kind
    # Full house
    # Flush
    # Straight
    # 3 of a kind (+ kicker)
    # 2 pairs (+ kicker)
    # Pair (+ kicker)
    # High card
  end

  def case
  end

  def compare_with(other_hand)
  end
end
