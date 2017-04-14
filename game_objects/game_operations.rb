# This module contain same operations
# for Player and Dealer classes

module GameOperations
  def bank_add(amount)
    self.bank += amount
  end

  def bank_subtruct(amount)
    self.bank -= amount
  end

  def add_card(card)
    hand << card
  end

  def free_hand
    self.hand = []
  end
end
