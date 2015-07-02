module Suricate
  class WidgetConfigurationsBuilder
    using Refinements::String
    class IDAlreadyUsedError < StandardError; end
    attr_reader :configurations

    def initialize(template_repository)
      @template_repository = template_repository
      @configurations      = []
    end

    def counter(id, collector, options = {})
      register(id, CounterWidget, collector, options)
    end

    def line_chart(id, collector, options = {})
      register(id, LineChartWidget, collector, options)
    end

    def register(id, klass, collector, options = {})
      id = id.to_sym
      if find_with_id(id)
        raise IDAlreadyUsedError.new("id \"#{id}\" already taken")
      else
        configuration   = build_configuration(id, klass, collector, options)
        @configurations << configuration
      end
    end

    private
    def build_configuration(id, klass, collector, options)
      build_options(id, klass.type, options)
      WidgetConfiguration.new(id.to_sym, klass, collector, options)
    end

    def build_options(id, type, options)
      options[:template] = find_widget_template(id, type, options[:template])
      if options[:templates]
        options[:templates].map! do |name|
          @template_repository.find_widget(name)
        end
      end
    end

    def find_widget_template(id, type, wanted_template)
      template         = nil
      default_template = type.underscore.sub(/_widget$/, '')
      template_names   = [wanted_template || id.to_s, default_template]

      template_names.each do |name|
        begin
          template = @template_repository.find_widget(name) and break
        rescue TemplateRepository::TemplateNotFound
        end
      end

      template.render if template
    end

    def find_with_id(id)
      @configurations.find { |conf| conf.id == id }
    end
  end
end
