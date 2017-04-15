# This class is responsible
# for actual black jack gameplay

class ApplicationGame
  attr_reader :ui, :stash, :player, :dealer, :deck, :round, :exit_game

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
      round.start_game

      victory_check

      unless player.bank_zero? || dealer.bank_zero?
        ui.exit_game_msg
        self.exit_game = gets.chomp
      end

      break if self.exit_game == 'exit' || self.exit_game == 'q'
    end
  end

  def victory_check
    if player.bank_zero?
      ui.player_defeat_msg
      self.exit_game = 'exit'
    end
    if dealer.bank_zero?
      ui.player_victory_msg
      self.exit_game = 'exit'
    end
  end

  def create_game_objects(name)
    self.player = Player.new(name)
    self.dealer = Dealer.new('THE DEALER')
    self.deck = Deck.new
    self.round = ApplicationRound.new(stash, player, dealer, deck)
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck, :round, :exit_game
end
