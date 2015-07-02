module Suricate
  class CounterWidgetResponse
    class NotAnNumberError < StandardError; end

    def initialize
      @value = nil
    end

    def value(value)
      raise NotAnNumberError.new("#{value} is not a number") unless value.is_a?(Numeric)
      @value = value
    end

    def to_h
      { value: @value }
    end
  end
end
