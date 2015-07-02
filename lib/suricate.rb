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
  autoload :LineChartWidget,              'suricate/widgets/line_chart_widget'

  # Responses
  autoload :CounterWidgetResponse,        'suricate/widgets/responses/counter_widget_response'
  autoload :ChartWidgetResponse,          'suricate/widgets/responses/chart_widget_response'

  # Charts
  autoload :Chart,                        'suricate/charts/chart'
  autoload :ChartSerie,                   'suricate/charts/chart_serie'
  autoload :ChartBuilder,                 'suricate/charts/chart_builder'
  autoload :ChartSerieBuilder,            'suricate/charts/chart_serie_builder'

  module Refinements
    autoload :String,                     'suricate/refinements/string'
  end


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
