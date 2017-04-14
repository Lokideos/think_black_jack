# This class is responsible for printing text messages
# to the instance of application_main class

class UiMain
  def greetings
    puts 'Welcome to the Black Jack card game!'
    puts
  end

  def good_luck
    puts 'Good luck in the following game!'
  end

  def exit_game_msg
    puts 'It was a pleasure to play with you!'
    puts
    puts "Type in 'exit' to exit the program "\
    'or anything else to continue.'
  end

  def show_menu
    puts '_______________________________________'
    puts '1. NEW GAME'
    puts '2. HELP'
    puts '3. EXIT'
    puts '_______________________________________'
    puts
  end

  def menu_choice_prompt
    print 'Please select one of menu options: '
  end

  def wrong_input
    puts "You've provided wrong input. Please, try again."
    puts
  end
end
