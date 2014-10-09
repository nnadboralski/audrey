require 'rails_helper'

RSpec.describe Audrey::Vote, :type => :model do
  describe "#Factory" do
    it "has a valid factory" do
     expect(build(:vote)).to be_valid
    end
  end

  describe "#Associations" do
    it "belongs to user" do
      expect(create(:vote).respond_to?(:user)).to eq(true)
    end

    it "belongs to topic" do
      expect(create(:vote).respond_to?(:topic)).to eq(true)
    end
  end

  describe "#Validations" do
    it "validates presence_of user" do
      expect(build(:vote, user: nil)).to_not be_valid
    end
    it "validates presence_of topic" do
      expect(build(:vote, topic: nil)).to_not be_valid
    end
    it "validates presence_of value" do
      expect(build(:vote, value: nil)).to_not be_valid
    end
  end
end