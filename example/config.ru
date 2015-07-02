require 'suricate'

require_relative 'collectors/static_counter_collector'
require_relative 'collectors/random_counter_collector'
require_relative 'collectors/random_line_chart_collector'

current_directory = File.dirname(__FILE__)

configuration = Suricate.build do |config|
  config.public_directory    = File.join(current_directory, 'public')
  config.templates_directory = File.join(current_directory, 'templates')
  config.default_page        = 'index'

  config.widgets do |widgets|
    widgets.counter :errors, RandomCounterCollector.new, placeholders: { name: 'Errors' },
                                                         interval: 400
    widgets.line_chart :earnings, RandomLineChartCollector.new, placeholders: { name: 'earnings' },
                                                                 interval: 1000
  end
end

application = Suricate::Application.new(configuration)

use Rack::Runtime

run application
