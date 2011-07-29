module Oulipo
  module Proxiable
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def proxy(target, *methods)
        methods.each do |method|
          
          define_method(method) do |*args, &block|
            self.send(target).send(method, *args, &block)
          end
          
        end
      end
      
    end
    
  end
end