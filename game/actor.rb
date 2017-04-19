# Class containing attributes and basic methods for both dealer and player
# In this case it's name and their hands (in terms of card game)

class Actor
  attr_reader :name, :hand

  def initialize(*_args)    
    self.hand = []
    self.score = 0
  end
  
  def add_cards(cards)
    cards.each { |card| add_card(card) }    
  end

  def add_card(card)
    hand << card    
  end  
  

  def free_hand
    self.hand = []
    self.score = 0
  end

  private

  attr_writer :name, :hand
end
