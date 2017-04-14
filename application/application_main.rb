# This class is responsible for the game loop
# and main menu

class ApplicationMain
  attr_reader :ui

  MAIN_MENU_CHOISES = {1 => :new_game, 2 => :help, 
                       3 => :exit}

  def initialize
    self.ui = UiMain.new
  end

  def run
    exit_program = "let's play"
    ui.greetings
    loop do
      ui.good_luck
      main_menu
      ui.exit_game_msg
      exit_program = gets.chomp
      break if exit_program == 'exit'
    end
  end

  def main_menu
    loop do
      ui.show_menu
      menu_choise = gets.chomp.to_i
      unless MAIN_MENU_CHOISES[menu_choise].nil?
        send MAIN_MENU_CHOISES[menu_choise]
      end
      break if menu_choise.to_i == 3
    end
  end

  def new_game
    p "new game"
  end

  def help
    #black jack game description
    p "help"
  end

  def exit
    p "exit"
  end

  private

  attr_writer :ui
end