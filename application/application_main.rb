# This class is responsible for the game loop
# and main menu

class ApplicationMain
  attr_reader :ui

  def initialize
    self.ui = UiMain.new
  end

  def run
    exit_program = "let's play"
    ui.greetings
    loop do
      ui.good_luck
      puts 'Run some code'
      ui.exit_game_msg
      exit_program = gets.chomp
      break if exit_program == 'exit'
    end
  end

  private

  attr_writer :ui
end