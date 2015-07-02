module Suricate
  class ChartSerie
    attr_reader :name, :values

    def initialize(name, values)
      @name = name
      @values = values
    end

    def to_h
      {
        name: @name,
        values: @values
      }
    end
  end
end
