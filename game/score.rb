# This class contan all needed methods and data 
# for calculating score in black jack card game

class Score
  attr_reader :points

  def initialize
    self.points = 0
  end

  def add_score(card_value)
    self.points += if ace?(card_value)
                     if self.points + ace_higher_value(card_value) <= 21
                       ace_higher_value(card_value)
                     else
                       ace_lower_value(card_value)
                     end
                   else
                     card_value
                   end
  end

  def ace?(card_value)
    card_value.is_a? Array
  end

  def ace_lower_value(card_value)
    card_value[0] if ace?(card_value)
  end

  def ace_higher_value(card_value)
    card_value[1] if ace?(card_value)
  end

  def points_zero!
    self.points = 0
  end

  private

  attr_writer :points
end
