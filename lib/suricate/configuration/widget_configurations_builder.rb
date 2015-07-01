module Suricate
  class WidgetConfigurationsBuilder
    attr_reader :configurations

    def initialize(template_repository)
      @template_repository = template_repository
      @configurations      = []
    end

    def counter(id, collector, options = {})
      register(id, CounterWidget, collector, options)
    end

    def register(id, klass, collector, options = {})
      configuration   = build_configuration(id, klass, collector, options)
      @configurations << configuration
    end

    private
    def build_configuration(id, klass, collector, options)
      build_options(id, klass.type, options)
      WidgetConfiguration.new(id, klass, collector, options)
    end

    def build_options(id, type, options)
      options[:template] = find_widget_template(id, type, options[:template])
      if options[:templates]
        options[:templates].map! do |name|
          @template_repository.find_widget(name)
        end
      end
    end

    def find_widget_template(id, type, template)
      default_template = type.to_s.sub(/Widget$/, '').downcase
      template_names = [template || id.to_s, default_template]
      template_names.each do |name|
        template = begin
                     @template_repository.find_widget(name)
                   rescue TemplateRepository::TemplateNotFound
                     nil
                   end
        return template.render if template
      end
    end
  end
end
