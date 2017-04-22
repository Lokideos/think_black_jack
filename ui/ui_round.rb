# This class is responsible for printing text messages
# to the instance of round class
module Ui
  class Round
    def show_table(player, dealer, player_bank, dealer_bank, player_score, _dealer_score)
      puts
      puts
      puts"          DEALER'S SCORE: ???"
      puts
      puts "          #{dealer.name} BANK:#{dealer_bank.balance}"
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
      puts "          #{player.name} BANK: #{player_bank.balance}"
      puts
      puts "         YOUR SCORE: #{player_score.points}"
      puts
      puts
    end

    def show_table_final(player, dealer, player_bank, dealer_bank, player_score, dealer_score)
      puts
      puts
      puts"          DEALER'S SCORE: #{dealer_score.points}"
      puts
      puts "          #{dealer.name} BANK:#{dealer_bank.balance}"
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
      puts "          #{player.name} BANK: #{player_bank.balance}"
      puts
      puts "         YOUR SCORE: #{player_score.points}"
      puts
      puts
    end

    def show_hand(player)
      player.hand.each { |card| print "|#{card.name}| " }
    end

    def show_hand_secret(dealer)
      dealer.hand.each { print '|*| ' }
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

    def draw_msg
      puts 'DRAW!'
      puts
    end

    def open_cards_exit_msg
      puts 'Nicely done!'
      puts
    end
  end
end
