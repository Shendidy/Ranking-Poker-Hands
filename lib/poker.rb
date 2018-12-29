class PokerHand
  # 1. decide the hand's best case
  # 2. Calculate hands total based on the cards and the evaluation
    # method explained in the README.md file.
  # 3. do the same for the second hand
  # 4. compare both hands and return result ("Win", "Tie", "Loss")

  @total = 0



  # 1.
    # Read hand string
  def self.hand(hand)
    @cards1 = hand.split(" ")
  end

  def self.total (cards = @cards1)# Calculate hand total points before adding value of best hand combination
    @cards1.each do |card|
      case card[0]
      when "2"
        @total += 2
      when "3"
        @total += 3
      when "4"
        @total += 4
      when "5"
        @total += 5
      when "6"
        @total += 6
      when "7"
        @total += 7
      when "8"
        @total += 8
      when "9"
        @total += 9
      when "T"
        @total += 10
      when "J"
        @total += 11
      when "Q"
        @total += 12
      when "K"
        @total += 13
      when "A"
        @total += 14
      end
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
