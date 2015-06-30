module Suricate
  class WidgetsBuilder
    attr_reader :widgets

    def initialize(template_repository)
      @template_repository = template_repository
      @widgets             = []
    end

    def counter(id, collector, options = {})
      register(id, CounterWidget, collector, options)
    end

    def register(id, klass, collector, options = {})
      configuration = build_configuration(id, klass.type, options)
      @widgets << klass.new(id, collector, configuration)
    end

    private
    def build_configuration(id, type, options)
      build_options(id, type, options)
      WidgetConfiguration.new(options)
    end

    def build_options(id, type, options)
      options[:template] = find_widget_template(id, type, options[:template])
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
