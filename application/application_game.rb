# This class is responsible
# for actual black jack gameplay
module Application
  class Game
    attr_reader :ui, :stash, :deck, :round, :exit_game
    attr_reader :player, :dealer, :player_bank, :dealer_bank, :player_score, :dealer_score

    def initialize
      self.ui = Ui::Game.new
      self.stash = 0
    end

    def run
      ui.greetings
      ui.input_name_msg
      name = gets.chomp
      game_init(name)
      initialize_game
    end

    def initialize_game
      loop do
        round.start_game

        victory_check

        unless player_bank.balance_zero? || dealer_bank.balance_zero?
          ui.exit_game_msg
          self.exit_game = gets.chomp
        end

        break if exit_game == 'exit' || exit_game == 'q'
      end
    end

    def victory_check
      if player_bank.balance_zero?
        ui.player_defeat_msg
        self.exit_game = 'exit'
      end
      if dealer_bank.balance_zero?
        ui.player_victory_msg
        self.exit_game = 'exit'
      end
    end

    def game_init(name)
      self.player = Player.new(name)
      self.dealer = Dealer.new
      self.player_bank = Bank.new
      self.dealer_bank = Bank.new
      self.player_score = Score.new
      self.dealer_score = Score.new
      self.deck = Deck.new
      self.round = Application::Round.new(stash, player, dealer, deck,
                                          player_bank, dealer_bank,
                                          player_score, dealer_score)
    end

    private

    attr_writer :ui, :stash, :deck, :round, :exit_game
    attr_writer :player, :dealer, :player_bank, :dealer_bank, :player_score, :dealer_score
  end
end
