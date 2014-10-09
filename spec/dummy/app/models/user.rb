class User < ActiveRecord::Base
  has_many :votes, class_name: "::Audrey::Vote"
  has_many :topics, class_name: "::Audrey::Topic", foreign_key: :owner_id
end
