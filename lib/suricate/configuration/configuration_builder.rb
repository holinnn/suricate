module Suricate
  class ConfigurationBuilder
    attr_accessor :templates_directory, :public_directory, :default_page

    def configuration
      Configuration.new(template_repository: template_repository,
                        widget_repository: widget_repository,
                        default_page: @default_page,
                        public_directory: @public_directory)
    end

    def widgets
      yield widget_configurations_builder
    end

    private
    def template_repository
      TemplateRepository.new(@templates_directory)
    end

    def widget_repository
      WidgetRepository.new(widget_configurations_builder.configurations)
    end

    def widget_configurations_builder
      @widgets_builder ||= WidgetConfigurationsBuilder.new(template_repository)
    end
  end
end
