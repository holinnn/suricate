require 'suricate'

current_directory = File.dirname(__FILE__)

configuration = Suricate.build do |config|
  config.public_directory    = File.join(current_directory, 'public')
  config.templates_directory = File.join(current_directory, 'templates')
  config.default_page        = 'index'

  config.widgets do |widgets|
    widgets.counter :errors, nil, name: 'Errors',
                                  template: 'counter'
  end
end

application = Suricate::Application.new(configuration)

run application
