module Suricate
  class WidgetRepository
    class WidgetNotFound < StandardError; end

    def initialize(widgets)
      @widgets = widgets
    end

    def find(id, options = {})
      @widgets.find { |widget| widget.id == id } or
        raise WidgetNotFound.new("widget with id=#{id} not found")
    end

    def all
      @widgets
    end
  end
end
