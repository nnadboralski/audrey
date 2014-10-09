require 'rails_helper'

RSpec.describe Audrey::Topic, :type => :model do
  context "#Factory" do
    it "has a valid factory" do
      expect(build(:topic)).to be_valid
    end
    it "generates a topic with votes" do
      topic = FactoryGirl.create(:topic, :with_votes)
      expect(topic.votes.count).to eq(100)
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
