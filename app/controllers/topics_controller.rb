class TopicsController < ApplicationController
    def index
        @topics = TopicStore.get_store().get_top_20()
    end

    def show
        @topic = TopicStore.get_store().get(params[:id].to_i)
    end

    def new
    end

    def create
        topic = Topic.new(topics_params['content'])
        TopicStore.get_store().add(topic)
        redirect_to :action => :index
    end

    private
    def topics_params
        params.require(:topic).permit(:content)
    end
end
