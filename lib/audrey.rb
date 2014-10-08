require "audrey/engine"

module Audrey
  mattr_accessor :owner_class

  # Sensible default
  @@owner_class = "User"

  def self.owner_class
    @@owner_class.constantize
  end
end