# This class will contain all require_relative links
# and will start the program itself.

require_relative 'ui/ui_main'
require_relative 'ui/ui_game'
require_relative 'application/application_main'
require_relative 'application/application_game'
require_relative 'game_objects/game_operations'
require_relative 'game_objects/player'

black_jack = ApplicationMain.new
black_jack.run
