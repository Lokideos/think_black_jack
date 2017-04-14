# This class is responsible
# for actual black jack gameplay

class ApplicationGame
  attr_reader :ui

  def initialize
    self.ui = UiGame.new
  end

  def run
    ui.greetings
    ui.input_name_msg
    name = gets.chomp
    p name
    # add name to player add bank and start play
  end

  private

  attr_writer :ui
end
