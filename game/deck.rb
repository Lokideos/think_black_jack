# This class controls deck in terms of filling it up
# and taking cards from this deck to player or dealer.

class Deck
  attr_reader :cards

  CARDS_TEMPLATE = [['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6],
                    ['7', 7], ['8', 8], ['9', 9], ['10', 10],
                    ['J', 10], ['Q', 10], ['K', 10], ['A', [1, 11]]].freeze

  SYMBOLS = ["\u2665", "\u2663", "\u2660", "\u2666"].freeze

  def initialize
    self.cards = []
  end

  def fill_deck
    self.cards = []
    CARDS_TEMPLATE.each do |card|
      SYMBOLS.each do |code|
        cards << Card.new("#{card[0]}#{code}", card[1])
      end
    end
  end

  def discard_card(card_name)
    card_to_del = cards.find { |card| card.name == card_name }
    cards.delete(card_to_del)
  end

  private

  attr_writer :cards
end
