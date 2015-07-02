module Suricate
  class CounterWidget < Widget
    def execute
      response = CounterWidgetResponse.new
      @collector.populate(response, params)

      api_success response.to_h
    end
  end
end
