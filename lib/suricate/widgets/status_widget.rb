module Suricate
  class StatusWidget < Widget
    def execute
      response = WidgetResponse.new
      @collector.populate(response, params)
      api_success response.to_h
    end
  end
end
