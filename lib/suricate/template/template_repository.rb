module Suricate
  class TemplateRepository
    class TemplateNotFound < StandardError; end
    SUPPORTED_FORMATS = %w(html txt).freeze

    attr_reader :path


    def initialize(path)
      @path = path
    end

    def find_widget(name)
      path = File.join('widgets', name)
      find(path)
    end

    def find_page(name)
      path = File.join('pages', name)
      find(path)
    end

    def find(name)
      path = find_full_path(name) or
        raise TemplateNotFound.new("#{name} can't be found in #{@path}")

      Template.new(path)
    end

    private
    def find_full_path(name)
      base_path = File.join(@path, name)
      if File.exists?(base_path)
        base_path
      else
        possible_paths = SUPPORTED_FORMATS.map { |format| base_path + ".#{format}" }
        possible_paths.find { |path| File.exists?(path) }
      end
    end
  end
end
