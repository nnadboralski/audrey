require_dependency "audrey/application_controller"

module Audrey
  class TopicsController < ApplicationController

    def index
      @topics = Topic.all.sort_by { |topic| topic.score }.reverse
    end

    def create
      topic = Topic.create(topic_params)
    end

    def show
      @topic = Topic.find(params[:id])
    end

    def update
      topic = Topic.find(params[:id])
      topic.update_attributes(topic_params)
    end

    def vote
      Vote.create(vote_params)
    end

    private
    def topic_params
      params.require(:topic).permit(:owner, :topic, :content)
    end

    def vote_params
      params.require(:vote).permit(:user, :topic, :value)
    end
  end
end

