# This class is responsible
# for actual black jack gameplay

class ApplicationGame
  attr_reader :ui, :stash, :player, :dealer, :deck, :round

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

      ui.exit_game_msg
      exit_game = gets.chomp
      break if exit_game == 'exit' || exit_game == 'q'
    end
  end

  def create_game_objects(name)
    self.player = Player.new(name)
    self.dealer = Dealer.new
    self.deck = Deck.new
    self.round = Round.new(stash, player, dealer, deck)
  end

  private

  attr_writer :ui, :stash, :player, :dealer, :deck, :round
end
