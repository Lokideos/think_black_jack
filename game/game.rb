# Class containing attributes and basic methods for both dealer and player

class Game
  attr_reader :name, :bank, :hand, :score

  def initialize(*_args)
    self.bank = 100
    self.hand = []
    self.score = 0
  end

  def bank_add(amount)
    self.bank += amount
  end

  def bank_subtruct(amount)
    self.bank -= amount
  end

  def bank_zero?
    self.bank <= 0
  end

  def add_cards(cards)
    cards.each { |card| add_card(card) }    
  end

  def add_card(card)
    hand << card    
  end

  def add_score(card)
    self.score += if ace?(card)
                    if self.score + ace_higher_value(card) < 21
                      ace_higher_value(card)
                    else
                      ace_lower_value(card)
                    end
                  else
                    card_value(card)
                  end
  end

  def ace?(card)
    card.is_a? Array
  end

  def ace_lower_value(card)
    card[1][0] if ace?(card)
  end

  def ace_higher_value(card)
    card[1][1] if ace?(card)
  end

  def card_value(card)
    card[1]
  end

  def free_hand
    self.hand = []
    self.score = 0
  end

  private

  attr_writer :name, :bank, :hand, :score
end
