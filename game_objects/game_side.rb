# Class containing attributes and basic methods for both dealer and player

class GameSide
  attr_reader :name, :bank, :hand, :score

  def initialize(name)
    self.name = name
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
    cards.each do |card|
      hand << card
      self.score += if card[1].is_a? Array
                      if score + card[1][1] < 21
                        card[1][1]
                      else
                        card[1][0]
                      end
                    else
                      card[1]
                    end
    end
  end

  def add_card(card)
    hand << card
    self.score += if card[1].is_a? Array
                    if self.score + card[1][1] < 21
                      card[1][1]
                    else
                      card[1][0]
                    end
                  else
                    card[1]
                  end
  end

  def free_hand
    self.hand = []
    self.score = 0
  end

  private

  attr_writer :name, :bank, :hand, :score
end
