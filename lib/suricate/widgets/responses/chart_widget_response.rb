require 'delegate'

module Suricate
  class ChartWidgetResponse
    def initialize
      @builder = ChartBuilder.new
    end

    def chart
      yield @builder
    end

    def to_h
      { chart: @builder.chart.to_h }
    end
  end
end
