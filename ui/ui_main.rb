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

  def show_help
    puts '__________BLACK_JACK_RULES_____________'
    puts '_______________________________________'
    puts "1: During this game you'll be fighting versus AI"
    puts '2: You bank amount is equal to 100 at the beginning'
    puts '3: The same applies to the dealer.'
    puts "4: The goal of this game is to empty dealer's bank."
    puts "5: At the beginning you'll have 2 cards."
    puts "6: You can 'PASS' to pass your turn to the opponent,"
    puts "7: You can 'TAKE CARD' to get another card,"
    puts "8: Or you can 'OPEN CARD' to proceed directly to the final point."
    puts '9: Each card has value. And your goal is to get sum value as close'
    puts "10: to '21' is possible but not greater than '21'."
    puts '11: All cards have values equal to number on them.'
    puts "12: All cards with pictures with the exception of 'A' have value equal to 10"
    puts "13: 'A' card has value equal to 1 or to 11."
    puts '_______________________________________'
    puts
  end
end
