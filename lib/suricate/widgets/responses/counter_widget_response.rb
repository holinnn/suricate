module Suricate
  class CounterWidgetResponse < WidgetResponse
    class NotAnNumberError < StandardError; end

    def initialize
      @value = nil
      super
    end

    def value(value)
      raise NotAnNumberError.new("#{value} is not a number") unless value.is_a?(Numeric)
      @value = value
    end

    def to_h
      super.tap do |hash|
        hash.merge!(value: @value)
      end
    end
  end
end
