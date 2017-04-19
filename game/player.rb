# This class is responsible for 'Player' game object
# It represents actual player's attributes

class Player < Actor
  def initialize(name)
    super
    self.name = name
  end
end
