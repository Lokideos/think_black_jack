# This class is responsible for printing text messages
# to the instance of application_game class
module Ui
  class Game
    def greetings
      puts
      puts 'Welcome to the fresh new game!'
      puts 'To begin with please type in your name.'
      puts
    end

    def input_name_msg
      print 'Please type in your name: '
    end

    def exit_game_msg
      puts 'Round is over. If you want to exit the game on this state '\
      "type in 'exit' or 'q'."
      puts 'But in this case your current progres '\
      'will not be saved.'
      puts 'If you want to continue press any key.'
      puts
    end

    def player_victory_msg
      puts 'Bank of your oponent is 0 meaning your victory is absolute!'
      puts 'Congratulations!'
      puts
    end

    def player_defeat_msg
      puts "There is nothing left in your bank meaning that you've lost."
      puts 'Better luck next time!'
      puts
    end
  end
end
