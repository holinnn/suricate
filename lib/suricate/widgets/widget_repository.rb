module Suricate
  class WidgetRepository
    class WidgetNotFound < StandardError; end
    attr_reader :configurations

    def initialize(configurations)
      @configurations = configurations
    end

    def instantiate(id, context)
      if configuration = find_configuration_with_id(id)
        configuration.instantiate(context)
      else
        raise WidgetNotFound.new("widget with id=#{id} not found")
      end
    end

    private
    def find_configuration_with_id(id)
      @configurations.find { |conf| conf.id == id }
    end
  end
end
