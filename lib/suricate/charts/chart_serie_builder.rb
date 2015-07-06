module Suricate
  class ChartSerieBuilder
    def initialize
      @values = []
    end

    def name(name)
      @name = name
    end

    def color(color)
      @color = color
    end

    # Add multiple values
    def values(values)
      @values.concat(values)
    end

    # Add one value
    def value(value)
      @values << value
    end

    def serie
      ChartSerie.new(@name, @values, @color)
    end
  end
end
