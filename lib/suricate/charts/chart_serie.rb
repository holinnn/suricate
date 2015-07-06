module Suricate
  class ChartSerie
    attr_reader :name, :values, :color

    def initialize(name, values, color)
      @name   = name
      @values = values
      @color  = color
    end

    def to_h
      {
        name: @name,
        values: @values,
        color: @color
      }
    end
  end
end
