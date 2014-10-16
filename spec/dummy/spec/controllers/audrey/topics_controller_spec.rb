require 'rails_helper'

RSpec.describe Audrey::TopicsController, :type => :controller do

  describe "#index" do
    it "should return ok and an index of all topics" do
      get :index, use_route: :audrey
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do
    let(:owner) { FactoryGirl.create(:user) }

    it "should return ok and create a new topic" do
      post :create, use_route: :audrey, topic: { topic: "This is a test topic", content: "This is test content", owner_id: owner.id.to_i }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#update" do
    let(:topic) { FactoryGirl.create(:topic, :with_votes) }

    it "should return ok and update an existing topic" do
      post :update, use_route: :audrey, id: topic.id, topic: { topic: "Update!" }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#vote" do
    let(:topic) { FactoryGirl.create(:topic, :with_votes) }
    let(:user) { FactoryGirl.create(:user) }

    it "should vote on a topic" do
      get :vote, use_route: :audrey, id: topic.id, vote: {topic_id: topic.id, value: 1 }
      expect(response).to have_http_status(:ok)
    end
  end
end
