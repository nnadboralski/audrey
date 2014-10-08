module Audrey
  class Topic < ActiveRecord::Base
    belongs_to :owner, class_name: Audrey.owner_class.to_s
    has_many :votes

    validates_presence_of :topic
    validates_presence_of :content
    validates_presence_of :owner

    def score
      Audrey::Vote.where(id: self.id).sum(:value)
    end

  end
end
