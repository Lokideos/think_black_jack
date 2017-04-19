# Class contains all needed methods and data for bank in black jack

class Bank
  attr_reader :balance

  def initialize
    self.balance = 100
  end

  def balance_add(amount)
    self.balance += amount
  end

  def balance_subtruct(amount)
    self.balance -= amount
  end

  def balance_zero?
    self.balance == 0
  end

  private

  attr_writer :balance
end