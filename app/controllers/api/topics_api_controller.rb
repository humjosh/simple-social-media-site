class Api::TopicsApiController < ApplicationController
    # Upvotes and downvotes are handled by an API controller. This allows
    # users to perform these actions asynchronously, without requiring a
    # browser refresh.
    skip_before_action :verify_authenticity_token
    
    def upvote
        topic = TopicStore.get_store().get(params[:id].to_i)
        topic.increase_score()
        render json: topic, status: :ok
    end

    def downvote
        topic = TopicStore.get_store().get(params[:id].to_i)
        topic.decrease_score()
        render json: topic, status: :ok
    end
end