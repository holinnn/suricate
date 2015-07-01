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

    def process
      yield callback
      execute
    end

    private
    def output_callback
      @output_callback ||= DelegationCallback.new(:json)
    end

    def execute; raise NotImplementedError; end
  end
end
