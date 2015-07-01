module Suricate
  class SinatraOutputDriver < OutputDriver
    extend Forwardable
    def_delegators :@application, :status, :content_type

    def initialize(application)
      @application = application
    end

    def render(content)
      @application.body(content)
    end
  end
end
