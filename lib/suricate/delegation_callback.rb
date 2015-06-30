module Suricate
  class DelegationCallback
    def initialize(*callbacks)
      callbacks.each do |callback|
        define_callback(callback)
      end
    end

    def call(callback_name, *args)
      callback = instance_variable_get(:"@#{callback_name}_callback")
      callback.call(*args) if callback
    end


    private
    def define_callback(callback)
      define_singleton_method callback.to_sym do |&block|
        instance_variable_set(:"@#{callback}_callback", block)
      end
    end
  end
end
