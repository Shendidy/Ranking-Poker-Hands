This is a kata in codewars.com called "Ranking Poker Hands"

**Below are the requirements as specified on codewars**

##

A famous casino is suddenly faced with a sharp decline of their revenues. They decide to offer Texas hold'em also online. Can you help them by writing an algorithm that can rank poker hands?

Task
Create a poker hand that has a method to compare itself to another poker hand:

compare_with(other_hand)
A poker hand has a constructor that accepts a string containing 5 cards:

PokerHand.new("KS 2H 5C JD TD")
The characteristics of the string of cards are:

Each card consists of two characters, where
The first character is the value of the card: 2, 3, 4, 5, 6, 7, 8, 9, T(en), J(ack), Q(ueen), K(ing), A(ce)
The second character represents the suit: S(pades), H(earts), D(iamonds), C(lubs)
A space is used as card separator between cards
The result of your poker hand compare can be one of these 3 options:

[ "Win", "Tie", "Loss" ]
Notes
Apply the Texas Hold'em rules for ranking the cards.
Low aces are NOT valid in this kata.
There is no ranking for the suits.
If you finished this kata, you might want to continue with Sortable Poker Hands

##

## My Notes:

- Created the lib and spec folders as well as initialising rspec.
- NOTE: make a scoring system where you count the total of the hand and add to:
    0 if the best is a high card
    100 if the best is a pair
    200 if the best is 2 pairs
    300 if the best is three of a kind
    400 if the best is straight
    500 if the best is flush
    600 if the best is full house
    700 if the best is four of a kind
    800 if the best is straight flush
    900 if the best is royal flush
- Created Hand class to represent each hand (mine and opponent's)
- in Hand created the following methods
  - hand: To split the string of cards to an array of cards
  - total: To calculate the total points of hand, before adding the numbers in the above note.
