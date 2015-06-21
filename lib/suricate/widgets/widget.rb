module Suricate
  class Widget
    attr_reader :id, :configuration, :collector

    def initialize(id, collector, configuration)
      @id            = id
      @collector     = collector
      @configuration = configuration
    end

    class << self
      def type
        name.match(/(?:::)?(\w+)$/)[1]
      end
    end

    def type
      self.class.type
    end
  end
end
