class TopicTest < ActiveSupport::TestCase
    test "topic IDs are auto-incrementing" do
        # arrange
        topic_1 = Topic.new('content')

        # act
        topic_2 = Topic.new('more content')

        # assert
        assert_equal topic_1.id + 1, topic_2.id
    end

    test "increase score adds 1 to the score" do
        # arrange
        topic = Topic.new('content', 1)

        # act
        topic.increase_score()

        # assert
        assert_equal(2, topic.score)
    end

    test "decrease score removes 1 from the score" do
        # arrange
        topic = Topic.new('content', 20)

        # act
        topic.decrease_score()

        # assert
        assert_equal(19, topic.score)
    end

    test "negative scores are allowed" do
        # arrange
        topic = Topic.new('content', 0)

        # act
        topic.decrease_score()

        # assert
        assert_equal(-1, topic.score)
    end
end
    