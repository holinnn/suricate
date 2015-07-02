module Suricate
  class LineChartWidget < Widget
    def execute
      response = ChartWidgetResponse.new
      @collector.populate(response, params)
      api_success response.to_h
    end
  end
end
