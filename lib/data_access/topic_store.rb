class TopicStore
    def self.get_store
        @@store_instance ||= TopicStore.new
    end

    def initialize
        @all_topics = Hash.new
    end
    
    def add(topic)
        @all_topics[topic.id] = topic
    end

    def get_top_20
        @all_topics.values.sort_by { |value| -value.score }.first(20)
    end

    def get(id)
        @all_topics[id]
    end
end
