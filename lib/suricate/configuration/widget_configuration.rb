module Suricate
  class WidgetConfiguration
    attr_reader  :id, :klass, :collector, :options

    def initialize(id, klass, collector, options = {})
      @id        = id
      @klass     = klass
      @collector = collector
      @options   = options
    end

    def instantiate(context)
      @klass.new(id: id, context: context, collector: collector, options: options)
    end

    def to_h
      {
        id: @id,
        type: @klass.type,
        configuration: @options
      }
    end
  end
end
