# This class is responsible for the game loop
# and main menu

class ApplicationMain
  attr_reader :ui, :game

  MAIN_MENU_CHOISES = { 1 => :new_game, 2 => :help,
                        3 => :exit }.freeze

  def initialize
    self.ui = UiMain.new
    self.game = ApplicationGame.new
  end

  def run
    ui.greetings
    loop do
      ui.good_luck
      main_menu
      ui.exit_game_msg
      break if gets.chomp == 'exit'
    end
  end

  def main_menu
    loop do
      ui.show_menu
      ui.menu_choice_prompt
      menu_choise = gets.chomp.to_i
      unless MAIN_MENU_CHOISES[menu_choise].nil?
        send MAIN_MENU_CHOISES[menu_choise]
      end
      break if menu_choise.to_i == 3
    end
  end

  def new_game
    game.run
  end

  def help
    ui.show_help
  end

  def exit; end

  private

  attr_writer :ui, :game
end
