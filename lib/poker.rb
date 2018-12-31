class PokerHand
  # 1. decide the hand's best case
    # method explained in the README.md file.
  # 3. do the same for the second hand
  # 4. compare both hands and return result ("Win", "Tie", "Loss")

  @total = 0
  @rf = @sf = @fk = @fh = @f = @s = @tk = @tp = @p = false
  @card_value = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}



  # 1.
    # Read hand string
  def self.hand(hand)
    @cards1 = sort_hand(hand.split(" ")) # contains each card as a seperate element
    @cards2 = @cards1.map{ |a| a.chr } # ignores the suit of each card
    @cards3 = @cards1.map{ |a| a[-1]} # gets only the suit of each card

    return @cards1
  end

  # a method to sort a hand in descending order
  def self.sort_hand(cards = @cards1)
    i = 0
    while i < cards.length
      j = i + 1
      while j < cards.length
        if @card_value[cards[i].chr] < @card_value[cards[j].chr]
          temp = cards[j]
          cards[j] = cards[i]
          cards[i] = temp
        end
        j += 1
      end
      i += 1
    end
    return cards
  end

  # Calculate hand total points before adding value of best hand combination
  def self.total (cards = @cards2)
    cards.each do |card|
      @total += @card_value[card]
    end
    @total
  end

  # Method to check what hand combination is achieved
  def self.best_hand
    # Royal Flush
    # Straight Flush
    # 4 of a kind
    # Full house
    # Flush
    # Straight
    # 3 of a kind (+ kicker)
    # 1 or 2 pairs (+ kicker)
    check_pairs(hand)
    # High card
  end

  def self.check_pairs(cards = @cards2) # receives the hand array without suits
    # ["K", "2", "5", "2", "T"]
    # returns true if at least 1 pair exists, plus an array of remaining cards sorted high to Low
    # pair = cards.detect{|card| cards.count(card) > 1}
    @p = @tp = false
    pair = cards.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)

    # if no duplicates
    answer = [false, cards] if pair == []
    return answer if pair == []

    # if found a pair
    pair.each {|a| cards.delete(a)}
    @p = true if pair.count == 1 && !@tp && !@tk && !@fh
    @tp = true if pair.count == 2 && !@p && !@th && !@fh
    return [pair, cards]

  end

  def self.final_total
    return @total += 900 if @rf
    return @total += 800 if @sf
    return @total += 700 if @fk
    return @total += 600 if @fh
    return @total += 500 if @f
    return @total += 400 if @s
    return @total += 300 if @thk
    return @total += 200 if @tp
    return @total += 100 if @p
  end

  def compare_with(other_hand)
  end
end



























# x
