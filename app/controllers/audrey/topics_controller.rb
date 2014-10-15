require_dependency "audrey/application_controller"

module Audrey
  class TopicsController < ApplicationController

    def index
      Topic.joins(:votes).select("audrey_topics.*, sum(audrey_votes.value) as vcount").group("audrey_topics.id").order("vcount DESC")
    end

    def create
      topic = Topic.create!(topic_params)
    end

    def show
      @topic = Topic.find(params[:id])
    end

    def update
      Topic.find_by!(id: params[:id]).update_attributes(topic_params)
    end

    def vote
      Topic.find(params[:id]).vote(params[:user])
    end

    private
    def topic_params
      params.require(:topic).permit(:owner_id, :topic, :content)
    end

    def vote_params
      params.require(:vote).permit(:user, :topic, :value)
    end
  end
end

