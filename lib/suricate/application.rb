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
      set :public_folder, Proc.new { configuration.public_directory }
      set :views,         Proc.new { configuration.templates_directory }
    end

    #
    # API
    #

    # Get widgets' configuration
    get('/api/widgets') do
      configurations = widget_repository.all.map do |widget|
        serializer = WidgetHashSerializer.new(widget)
        serializer.encode
      end
      send_api_success(widgets: configurations)
    end

    # Get widget's data
    get('/api/widgets/:id') do

    end

    #
    # Pages
    #

    # Pages
    get('/:page') do
      template = template_repository.find_page(params['page'])
      render_template(template)
    end

    # Default page
    get('/') do
      default = template_repository.find_page(@configuration.default_page)
      render_template(default)
    end

    private
    def render_template(template)
      body(template.render)
    end

    def send_api_success(data)
      response = {
        status: 200,
        data: data
      }
      json = JSON.generate(response)

      content_type(:json)
      body(json)
    end
  end
end
