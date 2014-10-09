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

  describe "#Associations" do
    it "belongs_to owner" do
      expect(create(:topic).respond_to?(:owner)).to eq(true)
    end

    it "has_many votes" do
      expect(create(:topic).respond_to?(:votes)).to eq(true)
    end
  end

  describe "#Validations" do
    it "validates presence_of user" do
      expect(build(:topic, owner: nil)).to_not be_valid
    end
    it "validates presence_of topic" do
      expect(build(:topic, topic: nil)).to_not be_valid
    end
    it "validates presence_of value" do
      expect(build(:topic, content: nil)).to_not be_valid
    end
  end

end
