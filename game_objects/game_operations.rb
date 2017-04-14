module GameOperations
  def bank_add(amount)
    self.bank += amount
  end

  def bank_subtruct(amount)
    self.bank -= amount
  end

  def add_card(card)
    self.hand << card
  end

  def free_hand
    self.hand = []
  end
end