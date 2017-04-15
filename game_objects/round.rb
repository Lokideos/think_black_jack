# This class was created for containing methods using for each round

class Round
  attr_reader :ui, :stash, :player, :dealer, :deck

  AMOUNT = 10

  def initialize(stash, player, dealer, deck)
    self.stash = stash
    self.player = player
    self.dealer = dealer
    self.deck = deck
  end

  def start_game
    # add cards to player's and dealer's hands
    deck.fill_deck
    add_first_hand
    make_bet
    player_turn
    dealer_turn
    victory
    # go to player turn
  end

  def player_turn
    puts "Your hand: #{player.hand}"
    puts 'Pass? Take card? Open card?'
  end

  def dealer_turn; end

  def victory; end

  def take_card
    card_num = rand(deck.cards.length)
    card = deck.cards[card_num]
    deck.discard_card(deck.cards[card_num])
  end

  def first_hand
    first_hand = []
    2.times do
      card_num = rand(deck.cards.length)
      first_hand << deck.cards[card_num]
      deck.discard_card(deck.cards[card_num])
    end
    first_hand
  end

  def add_first_hand
    player.add_cards(first_hand)
    dealer.add_cards(first_hand)
  end

  def make_bet
    player.bank_subtruct(AMOUNT)
    dealer.bank_subtruct(AMOUNT)
    self.stash += AMOUNT * 2
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck
end
