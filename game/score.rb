# This class contan all needed methods and data for calculating score in black jack card game

class Score
  attr_reader :points

  def initialize
    self.points = 0
  end

  def add_score(card)
    self.score += if ace?(card)
                    if self.score + ace_higher_value(card) < 21
                      ace_higher_value(card)
                    else
                      ace_lower_value(card)
                    end
                  else
                    card_value(card)
                  end
  end

  def ace?(card)
    card.is_a? Array
  end

  def ace_lower_value(card)
    card[1][0] if ace?(card)
  end

  def ace_higher_value(card)
    card[1][1] if ace?(card)
  end

  def card_value(card)
    card[1]
  end

  private

  attr_writer :points

end