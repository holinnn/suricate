module Suricate
  class WidgetHashSerializer
    def initialize(widget)
      @widget = widget
    end

    def encode
      {
        id: @widget.id,
        type: @widget.type,
        configuration: @widget.configuration.to_h
      }
    end
  end
end
