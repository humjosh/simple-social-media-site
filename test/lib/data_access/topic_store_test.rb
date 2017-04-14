class TopicStoreTest < ActiveSupport::TestCase
    
    setup do
        @store = TopicStore.new
    end

    test "topic IDs are auto-incrementing" do
        # arrange
        topic_1 = Topic.new('content')
        topic_2 = Topic.new('more content')

        # act
        @store.add(topic_1)
        @store.add(topic_2)

        # assert
        assert_equal topic_1.id + 1, topic_2.id
    end
    
    test "get top 20 returns all topics if there are fewer than 20" do
        # arrange
        @store.add(Topic.new('topic 1'))
        @store.add(Topic.new('topic 2'))
        @store.add(Topic.new('topic 3'))

        # act
        results = @store.get_top_20()

        # assert
        assert_equal(3, results.length)
    end

    test "get top 20 only returns the topics with the highest score" do
        # arrange
        low_score_topics = (1..20).map { |score| Topic.new('content', score) }
        high_score_topics = (21..40).map { |score| Topic.new('content', score) }
        more_low_score_topics = (1..20).map { |score| Topic.new('content', score) }

        all_topics = low_score_topics.concat(high_score_topics).concat(more_low_score_topics)

        for topic in all_topics do
            @store.add(topic)
        end

        # act
        results = @store.get_top_20()

        # assert
        assert_equal(20, results.length)
        for topic in high_score_topics do
            assert_includes(results, topic)
        end        
    end

    test "get returns the topic with the given ID" do
        # arrange
        topic_1 = Topic.new('topic_2')
        topic_2 = Topic.new('topic_2')
        topic_3 = Topic.new('topic_2')

        @store.add(topic_1)
        @store.add(topic_2)
        @store.add(topic_3)

        # act
        result = @store.get(topic_2.id)

        # assert
        assert_same(topic_2, result)
    end

    test "decrease topic score removes it from the top 20" do
        # arrange
        20.times { @store.add(Topic.new('content', 1)) }

        topic = Topic.new('content', 2)
        @store.add(topic)

        # topic should initially be in top 20
        assert_includes(@store.get_top_20, topic)

        # act
        2.times { topic.decrease_score() }
        
        # assert
        assert_not_includes(@store.get_top_20, topic)
    end

    test "increase topic score moves it into the top 20" do
        # arrange
        20.times { @store.add(Topic.new('content', 1)) }

        topic = Topic.new('content', 0)
        @store.add(topic)

        # topic should not initially be in top 20
        assert_not_includes(@store.get_top_20, topic)

        # act
        2.times { topic.increase_score() }
        
        # assert
        assert_includes(@store.get_top_20, topic)
    end
end