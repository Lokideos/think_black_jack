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
    make_bet
    player_turn
  end

  def player_turn
    ui.show_table(player, dealer)
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
    dealer.add_card(take_card) if dealer.score < 12
    open_cards
  end

  def open_cards
    ui.show_table_final(player, dealer)
    victory?
    ui.open_cards_exit_msg
  end

  def victory? 
    if player.score <= 21
      if player.score == dealer.score
        ui.draw_msg
        player.bank_add(stash / 2)
        dealer.bank_add(stash / 2)      
      elsif player.score > dealer.score
        ui.victory_msg
        player.bank_add(stash)
      else
        ui.defeat_msg
        dealer.bank_add(stash)
      end                       
    else
      ui.defeat_msg
      dealer.bank_add(stash)
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
