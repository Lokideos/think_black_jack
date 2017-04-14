# This class is responsible for printing text messages
# to the instance of application_game class

class UiGame
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
    puts 'Are you sure you want to exit this game?'
    puts 'You current progres will not be saved in this case!'
    puts "If so please type in 'exit' or 'q' to exit the game."
    puts
  end
end
