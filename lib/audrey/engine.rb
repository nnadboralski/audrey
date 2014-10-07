module Audrey
  class Engine < ::Rails::Engine
    isolate_namespace Audrey
    mattr_accessor :owner_class

    def self.owner_class
      @@owner_class.constantize
    end
  end
end
