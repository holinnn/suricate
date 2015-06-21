module Suricate
  class Configuration
    attr_reader :template_repository, :public_directory, :widget_repository,
                :default_page

    def initialize(options = {})
      @template_repository = options[:template_repository]
      @public_directory    = options[:public_directory]
      @widget_repository   = options[:widget_repository]
      @default_page        = options[:default_page]
    end
  end
end
