# This class is responsible
# for actual black jack gameplay

class ApplicationGame
  attr_reader :ui, :stash, :player, :dealer, :deck

  AMOUNT = 10

  def initialize
    self.ui = UiGame.new
    self.stash = 0
  end

  def run
    ui.greetings
    ui.input_name_msg
    name = gets.chomp
    create_game_objects(name)
    initialize_game
  end

  def initialize_game
    exit_game = "Let's play"
    loop do
      deck.fill_deck
      start_game

      ui.exit_game_msg
      exit_game = gets.chomp
      break if exit_game == 'exit' || exit_game == 'q'
    end
  end

  def start_game
    # add cards to player's and dealer's hands
    add_first_hand
    make_bet
    player_turn
    dealer_turn    
    victory
    # go to player turn
  end

  def player_turn
    puts "Your hand: #{player.hand}"
    puts "Pass? Take card? Open card?"
  end

  def dealer_turn
  end

  def victory
  end

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

  def create_game_objects(name)
    self.player = Player.new(name)
    self.dealer = Dealer.new
    self.deck = Deck.new
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck
end
