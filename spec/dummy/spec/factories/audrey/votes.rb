FactoryGirl.define do
  factory :vote, class: Audrey::Vote do
    topic { create :topic }
    user { create :user }
    value { [-1,1].sample }
  end
end