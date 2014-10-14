require 'rails_helper'

RSpec.describe Audrey::TopicsController, :type => :controller do

  describe "#index" do
    it "should return ok and an index of all topics" do
      get :index, use_route: :audrey
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do
    it "should return ok and create a new topic" do
      post :create, use_route: :audrey, topic: { topic: "This is a test topic" }
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

  describe "#show" do
    let(:topic) { FactoryGirl.create(:topic, :with_votes) }

    it "should return ok and display the specifc topic" do
      get :show, use_route: :audrey, id: topic.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#vote" do
    let(:topic) { FactoryGirl.create(:topic, :with_votes) }
    let(:user) { FactoryGirl.create(:user) }

    it "should vote on a topic" do
      get :vote, use_route: :audrey, vote: {topic_id: topic.id, value: 1, user_id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
