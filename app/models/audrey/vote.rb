module Audrey
  class Vote < ActiveRecord::Base
    belongs_to :user, class_name: Audrey.owner_class.to_s
    belongs_to :topic

    validates_uniqueness_of :user_id, scope: :topic_id

    validates_presence_of :user
    validates_presence_of :topic
    validates_presence_of :value
  end
end
