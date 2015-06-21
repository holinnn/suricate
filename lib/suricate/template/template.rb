module Suricate
  class Template
    def initialize(path)
      @path = path
    end

    def render
      File.read(@path)
    end
  end
end
