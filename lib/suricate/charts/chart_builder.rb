module Suricate
  class ChartBuilder
    def initialize
      @series = []
      @labels = []
    end

    def serie
      builder = ChartSerieBuilder.new
      yield builder
      @series << builder.serie
    end

    def labels(labels)
      @labels = labels
    end

    def chart
      Chart.new(@labels, @series)
    end
  end
end
