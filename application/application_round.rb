# This class is responsible for handling each round of the game

class ApplicationRound
  attr_reader :ui, :stash, :player, :dealer, :deck
  attr_reader :player_bank, :dealer_bank, :player_score, :dealer_score

  AMOUNT = 10

  PLAYER_ACTION = { 1 => :dealer_turn, 2 => :player_take_card,
                    3 => :open_cards }.freeze

  def initialize(stash, player, dealer, deck, player_bank, dealer_bank, player_score, dealer_score)
    self.stash = stash
    self.player = player
    self.dealer = dealer
    self.deck = deck
    self.player_bank = player_bank
    self.dealer_bank = dealer_bank
    self.player_score = player_score
    self.dealer_score = dealer_score
    self.ui = UiRound.new
  end

  def start_game
    self.stash = 0
    deck.fill_deck
    free_hands
    add_first_hands
    set_score
    make_bet
    player_turn
  end

  def player_turn
    ui.show_table(player, dealer, player_bank, dealer_bank, player_score, dealer_score)
    ui.choice_msg
    action = gets.chomp.to_i
    action = 1 if PLAYER_ACTION[action].nil?
    send PLAYER_ACTION[action]
  end

  def player_take_card
    player.add_card(take_card)
    dealer_turn
  end

  def dealer_turn
    dealer.add_card(take_card) if dealer_score.points < 12
    open_cards
  end

  def open_cards
    reorder_cards
    set_score
    ui.show_table_final(player, dealer, player_bank, dealer_bank, player_score, dealer_score)
    victory_calculate
    ui.open_cards_exit_msg
  end

  def victory_calculate
    if player_score.points <= 21
      if player_score.points == dealer_score.points
        ui.draw_msg
        player_bank.balance_add(stash / 2)
        dealer_bank.balance_add(stash / 2)
      elsif player_score.points > dealer_score.points
        ui.victory_msg
        player_bank.balance_add(stash)
      else
        ui.defeat_msg
        dealer_bank.balance_add(stash)
      end
    else
      ui.defeat_msg
      dealer_bank.balance_add(stash)
    end
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

  def set_score
    player_score.points_zero!
    dealer_score.points_zero!
    player.hand.each { |card| player_score.add_score(card.value) }
    dealer.hand.each { |card| dealer_score.add_score(card.value) }
  end

  # Neeeded for aces calculation
  def reorder_cards
    player.hand.each do |card|
      if card.ace?
        player.hand.delete(card)
        player.hand << card
      end
    end
    dealer.hand.each do |card|
      if card.ace?
        dealer.hand.delete(card)
        dealer.hand << card
      end
    end
  end

  def free_hands
    player.free_hand
    dealer.free_hand
  end

  def make_bet
    player_bank.balance_subtruct(AMOUNT)
    dealer_bank.balance_subtruct(AMOUNT)
    self.stash += AMOUNT * 2
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck
  attr_writer :player_bank, :dealer_bank, :player_score, :dealer_score
end
