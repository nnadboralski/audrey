module Audrey
  class Engine < ::Rails::Engine
    config.after_initialize do
      const_set(Audrey.owner_class, Class.new(ActiveRecord::Base)).class_eval do
        has_many :votes, class_name: "::Audrey::Vote"
      end
    end
  end
end
