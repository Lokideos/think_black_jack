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
end
