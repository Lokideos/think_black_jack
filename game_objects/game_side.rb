class GameSide
  attr_reader :name, :bank, :hand

  def initialize(name)
    self.name = name
    self.bank = 100
    self.hand = []
  end

  def bank_add(amount)
    self.bank += amount
  end

  def bank_subtruct(amount)
    self.bank -= amount
  end

  def add_cards(cards)
    cards.each do |card|
      hand << card
    end
  end

  def add_card(card)
    hand << card
  end

  def free_hand
    self.hand = []
  end

  private

  attr_writer :name, :bank, :hand
end
