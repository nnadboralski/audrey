module Audrey
  class Topic < ActiveRecord::Base
    belongs_to :owner, class_name: Audrey.owner_class.to_s
  end
end
