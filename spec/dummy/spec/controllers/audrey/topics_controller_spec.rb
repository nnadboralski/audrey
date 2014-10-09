require 'rails_helper'

RSpec.describe Audrey::TopicsController, :type => :controller do

  describe "#show" do
    it "should return page's info" do
      get :index, use_route: :audrey
      expect(response).to have_http_status(:ok)
    end

    it "should return status and error when no such page" do
      get :show, format: :json, id: 0

      expect(response).to have_http_status(:not_found)
      expect(json_response["error"]).to eq translation_for('controllers.api.static_pages.errors.not_found')
    end
  end
end

