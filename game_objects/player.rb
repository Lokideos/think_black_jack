# This class is responsible for 'Player' game object
# It represents actual player's attributes

class Player
  include GameOperations

  attr_reader :name, :bank, :hand

  def initialize(name)
    self.name = name
    self.bank = 100
    self.hand = []
  end

  private

  attr_writer :name, :bank, :hand
end
