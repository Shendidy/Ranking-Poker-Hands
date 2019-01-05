class PokerHand
  # 1. decide the hand's best case
    # method explained in the README.md file.
  # 3. do the same for the second hand
  # 4. compare both hands and return result ("Win", "Tie", "Loss")

  @total = 0
  @winner = {rf: false, sf: false, fk: false, fh: false, f: false, s: false, tk: false, tp: false, p: false}
  @card_value = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
  @main, @secondary = String.new
  @remaining = []

  def self.reset_variables
    @winner.each{|k, v| @winner[k] = false}
    @main = @secondary = ""
    @remaining = []
  end

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
  def self.best_hand_rank(suits = @cards3, cards = @cards2)
    # check Royal Flush
    if check_royal_flush(suits, cards)
      return ["Royal Flush"]
    # check Straight Flush
    elsif check_straight_flush(suits, cards)
      return ["Straight Flush", @secondary]
    # check 4 of a kind
  elsif check_four_of_a_kind(cards)
      return ["Four of a Kind", @main, @remaining]
    # check Full house
    elsif check_full_house(cards)
      return ["Full House", @main, @remaining[0]]
    # check Flush
    elsif check_flush(suits, cards)
      return ["Flush", @remaining]
    # check Straight
    elsif check_straight(cards)
      return ["Straight", @main]
    # check 3 of a kind (+ kicker)
    elsif check_three_of_a_kind(cards)
      return ["Three of a kind", @main, @remaining]
    # check 2 pairs (+ kicker)
    elsif check_2pairs(cards)
      return ["Two pairs", @main, @secondary, @remaining]
    # check a pair (+ kicker)
    elsif check_pair(cards)
      return ["Pair"]
    # High card (refer to @cards2)
    else
      return ["High Card"]
    end
  end

  def self.check_royal_flush(suits = @cards3, cards = @cards2)
    reset_variables
    return check_straight_flush(suits, cards) if !check_straight_flush(suits, cards)
    return false if cards[0] != "A"
    @winner[:rf] = true
    return true
  end

  def self.check_straight_flush(suits = @cards3, cards = @cards2)
    reset_variables
    return check_straight(cards) if !check_straight(cards)
    return check_flush(suits, cards) if !check_flush(suits, cards)
    @winner[:sf] = true
    @secondary = cards[0]
    return true
  end

  def self.check_four_of_a_kind(cards = @cards2)
    reset_variables
    four_cards = cards.group_by{|e| e}.select{|k, v| v.size > 3}.map(&:first)

    # if no 4 of a Kind
    return false if four_cards.count != 1

    # if four of a Kind
    four_cards.each {|a| cards.delete(a)}
    @winner[:fk] = true if four_cards.count == 1

    @main = four_cards.join
    @remaining = cards.join

    return true

  end

  def self.check_full_house(cards = @cards2)
    reset_variables
    three = check_three_of_a_kind(cards)
    return false if !three || @remaining[0] != @remaining[1]
    if @remaining[0] == @remaining[1]
      @winner[:fh] = true
      return true
    end
  end

  def self.check_flush(suits = @cards3, cards = @cards2)
    reset_variables
    flush = false
    (1..4).each do |a|
      if suits[a - 1] != suits[a]
        flush = false
        break
      else
        flush = true
      end
    end
    return flush if !flush
    @winner[:f] = true
    @remaining = cards
    return true
  end

  def self.check_straight(cards = @cards2)
    reset_variables
    straight = false
    (1..4).each do |a|
      if @card_value[cards[a - 1]] - @card_value[cards[a]] != 1
        straight = false
        break
      else
        straight = true
      end
    end
    return straight if !straight
    @winner[:s] = true
    @main = cards[0]
    return true
  end

  def self.check_three_of_a_kind(cards = @cards2)
    reset_variables
    three_card = cards.group_by{|e| e}.select{|k, v| v.size > 2}.map(&:first)

    # if no 3 of a Kind
    return false if three_card.count != 1

    # if three of a Kind
    @winner[:tk] = true if three_card.count == 1
    @remaining = cards - three_card
    @main = three_card.join
    return true
  end

  def self.check_2pairs(cards = @cards2)
    reset_variables
    pairs = cards.group_by{|e| e}.select{|k, v| v.size > 1}.map(&:first)

    # if no 2 pairs
    return false if pairs.count != 2

    # if found 2 pairs
    pairs.each {|a| cards.delete(a)}
    @winner[:tp] = true if pairs.count == 2
    @main = pairs[0]
    @secondary = pairs[1]
    @remaining = (cards - pairs).join
    
    return true
  end

  def self.check_pair(cards = @cards2) # receives the hand array without suits
    @winner.each{|k, v| @winner[k] = false}
    pair = cards.group_by{|e| e}.select{|k, v| v.size > 1}.map(&:first)

    # if no duplicates
    return false if pair.count != 1

    # if found a pair
    pair.each {|a| cards.delete(a)}
    @winner[:p] = true if pair.count == 1
    return [pair.join, cards]

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
