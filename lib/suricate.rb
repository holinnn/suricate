module Suricate
  # Configuration
  autoload :WidgetConfigurationsBuilder,  'suricate/configuration/widget_configurations_builder'
  autoload :ConfigurationBuilder,         'suricate/configuration/configuration_builder'
  autoload :Configuration,                'suricate/configuration/configuration'
  autoload :WidgetConfiguration,          'suricate/configuration/widget_configuration'

  # Templating
  autoload :TemplateRepository,           'suricate/template/template_repository'
  autoload :Template,                     'suricate/template/template'

  # Application
  autoload :Application,                  'suricate/application'
  autoload :WidgetRepository,             'suricate/widget_repository'
  autoload :SinatraDriver,                'suricate/sinatra_driver'
  autoload :RequestContext,               'suricate/request_context'
  autoload :OutputDriver,                 'suricate/output_driver'
  autoload :SinatraOutputDriver,          'suricate/sinatra_output_driver'

  # Widgets
  autoload :Widget,                       'suricate/widgets/widget'
  autoload :CounterWidget,                'suricate/widgets/counter_widget'


  # Utils
  autoload :DelegationCallback,    'suricate/delegation_callback'

  class << self
    def build
      builder = ConfigurationBuilder.new
      yield builder
      builder.configuration
    end
  end
end
