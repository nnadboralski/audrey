require_dependency "audrey/application_controller"

module Audrey
  class TopicsController < ApplicationController
    before_filter :authenticate, except: :index

    def index
      @topics = Topic.joins{votes.outer}.select("audrey_topics.*, sum(audrey_votes.value) as vcount").group("audrey_topics.id").order("vcount DESC")
    end

    def new
      @topic = Topic.new
    end

    def create
      params[:owner_id] = current_user.id
      topic = Topic.create!(topic_params)
    end

    def show
      @topic = Topic.find(params[:id])
    end

    def update
      Topic.find_by!(id: params[:id]).update_attributes(topic_params)
    end

    def vote
      Topic.find(params[:id]).vote(current_user.id)
    end

    private
    def topic_params
      params.permit(:owner_id, :topic, :content)
    end

    def vote_params
      params.require(:vote).permit(:user, :topic, :value)
    end

    def authenticate
      unless !current_user.nil?
        redirect_to(root_path)
      end
    end
  end
end

