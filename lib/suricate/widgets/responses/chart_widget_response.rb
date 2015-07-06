require 'delegate'

module Suricate
  class ChartWidgetResponse < WidgetResponse
    def initialize
      @builder = ChartBuilder.new
      super
    end

    def chart
      yield @builder
    end

    def to_h
      super.tap do |hash|
        hash.merge!(chart: @builder.chart.to_h)
      end
    end
  end
end
