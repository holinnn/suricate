require 'sinatra'
require 'json'

module Suricate
  class Application < Sinatra::Base
    extend Forwardable
    def_delegators :@configuration, :widget_repository, :template_repository

    def initialize(configuration)
      super(nil)
      # TODO : switch to Rack directly
      # Good : hide Sinatra complexity from outside,
      # the interface will be the same when switchting to Rack
      # Bad  : set class var from instance
      self.class.set(:configuration, configuration)
      @configuration = configuration
    end

    configure do
      set :public_folder,   Proc.new { configuration.public_directory }
      set :views,           Proc.new { configuration.templates_directory }
      set :show_exceptions, :after_handler
    end




    #
    # Errors
    #

    error WidgetRepository::WidgetNotFound do
      output.api_error(404, env['sinatra.error'].message)
    end




    #
    # API
    #

    # Get widgets' configuration
    get('/api/widgets') do
      configurations = widget_repository.configurations.map(&:to_h)
      output.api_success(widgets: configurations)
    end

    # Get widget's data
    get('/api/widgets/:id') do
      widget = widget_repository.instantiate(params['id'], context)
      widget.execute
    end




    #
    # Pages
    #

    # Pages
    get('/:page') do
      render_page(params['page'])
    end

    # Default page
    get('/') do
      render_page(@configuration.default_page)
    end




    private
    def context
      RequestContext.new(request: request, session: session, output: output)
    end

    def output
      @output ||= SinatraOutputDriver.new(self)
    end

    def render_page(page)
      template = template_repository.find_page(page)
      output.render(template.render)
    end
  end

end
