# This class controls deck in terms of filling it up
# and taking cards from this deck to player or dealer.

class Deck
  attr_reader :cards

  CARDS_TEMPLATE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                     '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10,
                     'Q' => 10, 'K' => 10, 'A' => [1, 11] }.freeze

  SYMBOLS = ["\u2665", "\u2663", "\u2660", "\u2666"].freeze

  def initialize
    self.cards = {}
  end

  def fill_deck
    self.cards = {}
    CARDS_TEMPLATE.each do |name, value|
      SYMBOLS.each do |code|
        cards["#{name}#{code}"] = value
      end
    end
  end

  def take_card(card_name)
    cards.delete(card_name)
  end

  private

  attr_writer :cards
end
