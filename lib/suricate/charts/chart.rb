module Suricate
  class Chart
    def initialize(labels, series)
      @labels = labels
      @series = series
    end

    def to_h
      {
        labels: @labels,
        series: @series.map(&:to_h)
      }
    end
  end
end
