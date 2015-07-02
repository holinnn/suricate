module Suricate::Refinements
  module String
    refine ::String do
      def camelize
        self.dup.split(/_/).map{ |word| word.capitalize }.join('')
      end

      def constantize
        self.split('::').inject(Object) do |mod, class_name|
          mod.const_get(class_name)
        end
      end

      def underscore
        gsub(/(.)([A-Z])/,'\1_\2').downcase
      end

      def demodulize
        if i = rindex('::')
          [(i+2)..-1]
        else
          self
        end
      end
    end
  end
end
