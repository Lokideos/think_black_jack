# This class contain data and methods for cards
# Those cards will be included in deck for playing in black jack or other card games

class Card
  attr_reader :name, :value

  def initialize(name, value)
    self.name = name
    self.value = value
  end

  private

  attr_writer :name, :value

end