# This class will contain all require_relative links
# and will start the program itself.

require_relative 'modules/validation'
require_relative 'ui/ui_main'
require_relative 'ui/ui_game'
require_relative 'ui/ui_round'
require_relative 'application/application_main'
require_relative 'application/application_game'
require_relative 'application/application_round'
require_relative 'game_objects/game_side'
require_relative 'game_objects/player'
require_relative 'game_objects/dealer'
require_relative 'game_objects/deck'

black_jack = ApplicationMain.new
black_jack.run
