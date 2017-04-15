# This class was created for containing methods using for each round

class Round
  attr_reader :ui, :stash, :player, :dealer, :deck

  AMOUNT = 10

  PLAYER_ACTION = { 1 => :dealer_turn, 2 => :player_take_card,
                    3 => :open_cards }.freeze

  def initialize(stash, player, dealer, deck)
    self.stash = stash
    self.player = player
    self.dealer = dealer
    self.deck = deck
    self.ui = UiRound.new
  end

  def start_game
    self.stash = 0
    deck.fill_deck
    free_hands
    add_first_hands
    make_bet
    player_turn
  end

  def player_turn
    ui.show_table(player, dealer)
    ui.choice_msg
    action = gets.chomp.to_i
    send PLAYER_ACTION[action] unless PLAYER_ACTION[action].nil?
  end

  def player_take_card
    player.add_card(take_card)
    dealer_turn
  end

  def dealer_turn
    dealer.add_card(take_card) if dealer.score < 12
    open_cards
  end

  def open_cards
    if player.score > dealer.score && player.score <= 21
      ui.victory_msg
      player.bank_add(stash)
    else
      ui.defeat_msg
      dealer.bank_add(stash)
    end
    ui.show_table_final(player, dealer)
  end

  def take_card
    card_num = rand(deck.cards.length)
    card = deck.cards[card_num]
    deck.discard_card(deck.cards[card_num])
    card
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

  def add_first_hands
    player.add_cards(first_hand)
    dealer.add_cards(first_hand)
  end

  def free_hands
    player.free_hand
    dealer.free_hand
  end

  def make_bet
    player.bank_subtruct(AMOUNT)
    dealer.bank_subtruct(AMOUNT)
    self.stash += AMOUNT * 2
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck
end
