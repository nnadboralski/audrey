FactoryGirl.define do
  factory :topic, class: Audrey::Topic do
    topic   {"An automatically generated topic"}
    content {"Automatically generated content"}
    owner   { create :user }
    trait :with_votes do
      after(:create) do |topic, evaluator|
        (1..100).each do
          FactoryGirl.create(:vote, user: FactoryGirl.create(:user), topic: topic, value: [-1,1].sample)
        end
      end
    end
  end
end