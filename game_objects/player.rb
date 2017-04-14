class Player
  include GameOperations

  attr_accessor :name
  attr_reader :bank, :hand  
  
  def initialize
    self.bank = 100
    self.hand = []
  end

  private

  attr_writer :bank, :hand
end