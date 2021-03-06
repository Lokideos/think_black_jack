# This class will contain all require_relative links
# and will start the program itself.

require_relative 'modules/validation'
require_relative 'ui/ui_main'
require_relative 'ui/ui_game'
require_relative 'ui/ui_round'
require_relative 'application/application_main'
require_relative 'application/application_game'
require_relative 'application/application_round'
require_relative 'game/actor'
require_relative 'game/bank'
require_relative 'game/score'
require_relative 'game/player'
require_relative 'game/dealer'
require_relative 'game/card'
require_relative 'game/deck'

black_jack = Application::Main.new
black_jack.run
