module Suricate
  class RequestContext
    extend Forwardable
    def_delegators :@request, :params

    attr_reader :request, :session, :output

    def initialize(options = {})
      @request = options[:request]
      @session = options[:session]
      @output  = options[:output]
    end
  end
end
