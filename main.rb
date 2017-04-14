# This class will contain all require_relative links
# and will start the program itself.

require_relative 'ui/ui_main'
require_relative 'application/application_main'

black_jack = ApplicationMain.new
black_jack.run
