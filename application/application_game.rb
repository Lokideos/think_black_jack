# This class is responsible
# for actual black jack gameplay

class ApplicationGame
  attr_reader :ui, :stash

  def initialize
    self.ui = UiGame.new
    self.stash = 0
  end

  def run
    ui.greetings
    ui.input_name_msg
    name = gets.chomp
    create_game_objects(name)
    start_game
  end

  def start_game
    # add cards to player's and dealer's hands
    player.bank_subtruct(10)
    dealer.bank_subtruct(10)
    stash += 20
    # go to player turn
  end

  def create_game_objects(name)
    player = Player.new(name)
    dealer = Dealer.new
  end

  private

  attr_writer :ui, :stash
end
