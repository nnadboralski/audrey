module Audrey
  class Topic < ActiveRecord::Base
    belongs_to :owner, class_name: Audrey.owner_class.to_s
    has_many :votes

    validates_presence_of :topic
    validates_presence_of :content
    validates_presence_of :owner

    scope :order_by_votes, -> { includes(:votes).select('topics.id, sum(votes.value) as vote_score').group('topics.id').order('vote_score desc') }

    def score
      self.votes.sum(:value)
    end

  end
end
