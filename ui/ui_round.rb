# This class is responsible for printing text messages
# to the instance of round class

class UiRound
  def show_table(player, dealer)
    puts
    puts
    puts"          DEALER'S SCORE: ???"
    puts
    puts "          #{dealer.name} BANK:#{dealer.bank}"
    puts "          #{dealer.name}"
    puts '_________________________________'
    puts
    print '         '; show_hand_secret(dealer)
    puts
    puts
    puts
    puts
    puts
    print '         '; show_hand(player)
    puts
    puts '_________________________________'
    puts "          #{player.name}"
    puts "          #{player.name} BANK: #{player.bank}"
    puts
    puts "         YOUR SCORE: #{player.score}"
    puts
    puts
  end

  def show_table_final(player, dealer)
    puts
    puts
    puts"          DEALER'S SCORE: #{dealer.score}"
    puts
    puts "          #{dealer.name} BANK:#{dealer.bank}"
    puts "          #{dealer.name}"
    puts '_________________________________'
    puts
    print '         '; show_hand(dealer)
    puts
    puts
    puts
    puts
    puts
    print '         '; show_hand(player)
    puts
    puts '_________________________________'
    puts "          #{player.name}"
    puts "          #{player.name} BANK: #{player.bank}"
    puts
    puts "         YOUR SCORE: #{player.score}"
    puts
    puts
  end

  def show_hand(player)
    player.hand.each do |card|
      print "|#{card[0]}| "
    end
  end

  def show_hand_secret(dealer)
    dealer.hand.each do |_card|
      print '|*| '
    end
  end

  def choice_msg
    puts '1. PASS'
    puts '2. TAKE CARD'
    puts '3. OPEN CARDS'
    puts
  end

  def victory_msg
    puts '!!!YOU ARE THE WINNER!!!'
    puts
  end

  def defeat_msg
    puts "YOU'VE BEEN DEFEATED! BETTER LUCK NEXT TIME!"
    puts
  end
end
