require "audrey/engine"

module Audrey
  mattr_accessor :owner_class
  # Sensible default.
  @@owner_class = "User" unless @@owner_class

  def self.owner_class=(klass='User')
    @@owner_class = klass
  end

  def self.owner_class
    @@owner_class.constantize
  end
end