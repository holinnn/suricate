module Suricate
  class WidgetResponse
    def initialize
      @status = 'ok'
    end

    def to_h
      { status: @status }
    end

    def warning!
      @status = 'warning'
    end

    def alert!
      @status = 'alert';
    end

    def ok!
      @status = 'ok'
    end
  end
end
