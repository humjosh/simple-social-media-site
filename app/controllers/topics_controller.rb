class TopicsController < ApplicationController
    def index
        @topics = TopicStore.get_store().get_top_20()
    end
end
