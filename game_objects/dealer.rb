class Dealer
  include GameOperations

  attr_reader :name, :bank, :hand  
  
  def initialize
    self.name = "The Dealer"
    self.bank = 100
    self.hand = []
  end

  private

  attr_writer :name, :bank, :hand
end