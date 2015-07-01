module Suricate
  class Widget
    attr_reader :id, :options, :collector

    def initialize(options = {})
      @id        = options[:id]
      @context   = options[:context]
      @options   = options[:options]
      @collector = options[:collector]
    end

    class << self
      def type
        name.match(/(?:::)?(\w+)$/)[1]
      end
    end

    def type
      self.class.type
    end

    def execute
      raise NotImplementedError.new("Suricate::Widget is a template class, #execute must be implamented in subclass")
    end
  end
end
