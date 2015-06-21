module Suricate
  class WidgetRepository
    class WidgetNotFound < StandardError; end

    def initialize(widgets)
      @widgets = widgets
    end

    def find(id)
      @widgets.find { |widget| widget.id == id } or
        raise WidgetNotFound.new(id)
    end

    def all
      @widgets
    end
  end
end
