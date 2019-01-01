class PokerHand
  # 1. decide the hand's best case
    # method explained in the README.md file.
  # 3. do the same for the second hand
  # 4. compare both hands and return result ("Win", "Tie", "Loss")

  @total = 0
  @winner = {rf: false, sf: false, fk: false, fh: false, f: false, s: false, tk: false, tp: false, p: false}
  @card_value = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}



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
    # check Royal Flush
    # check Straight Flush
    # check 4 of a kind
    # check Full house
    # check Flush
    # check Straight
    check_straight(hand)
    # check 3 of a kind (+ kicker)
    check_three_of_a_kind(hand)
    # check 2 pairs (+ kicker)
    check_2pairs(hand)
    # check a pair (+ kicker)
    check_pair(hand)
    # High card (refer to @cards2)
  end

  def self.check_straight(cards = @cards2)
    @winner.each{|k, v| @winner[k] = false}
    straight = false
    (1..4).each do |a|
      if @card_value[cards[a - 1]] - @card_value[cards[a]] != 1
        straight = false
        break
      else
        straight = true
      end
    end

    answer = [straight, cards[0]]
    return answer

    # if no straight
    #annswer
    #return answer if

    # if straight

  end

  def self.check_three_of_a_kind(cards = @cards2)
    @winner.each{|k, v| @winner[k] = false}
    three_cards = cards.group_by{|e| e}.select{|k, v| v.size > 2}.map(&:first)

    # if no 3 of a Kind
    answer = [false, cards] if three_cards.count != 1
    return answer if three_cards.count != 1

    # if three of a Kind
    three_cards.each {|a| cards.delete(a)}
    @winner[:tk] = true if three_cards.count == 1
    return [three_cards, cards]
  end

  def self.check_2pairs(cards = @cards2)
    @winner.each{|k, v| @winner[k] = false}
    pairs = cards.group_by{|e| e}.select{|k, v| v.size > 1}.map(&:first)

    # if no duplicates
    answer = [false, cards] if pairs.count != 2
    return answer if pairs.count != 2

    # if found 2 pairs
    pairs.each {|a| cards.delete(a)}
    @winner[:tp] = true if pairs.count == 2
    return [pairs, cards]
  end

  def self.check_pair(cards = @cards2) # receives the hand array without suits
    @winner.each{|k, v| @winner[k] = false}
    pair = cards.group_by{|e| e}.select{|k, v| v.size > 1}.map(&:first)

    # if no duplicates
    answer = [false, cards] if pair.count != 1
    return answer if pair.count != 1

    # if found a pair
    pair.each {|a| cards.delete(a)}
    @winner[:p] = true if pair.count == 1
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
