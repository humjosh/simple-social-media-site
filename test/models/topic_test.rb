class TopicTest < ActiveSupport::TestCase
    test "increase score adds 1 to the score" do
        # arrange
        topic = Topic.new('content')
        assert_equal(0, topic.score)

        # act
        topic.increase_score()

        # assert
        assert_equal(1, topic.score)
    end

    test "decrease score removes 1 from the score" do
        # arrange
        topic = Topic.new('content')
        assert_equal(0, topic.score)

        # act
        topic.decrease_score()

        # assert
        assert_equal(-1, topic.score)
    end

    test "score can be increased multiple times" do
        # arrange
        topic = Topic.new('content')

        # act
        topic.increase_score()
        topic.increase_score()
        topic.increase_score()

        # assert
        assert_equal(3, topic.score)
    end

    test "score can be decreased multiple times" do
        # arrange
        topic = Topic.new('content')

        # act
        topic.decrease_score()
        topic.decrease_score()
        topic.decrease_score()

        # assert
        assert_equal(-3, topic.score)
    end
end
    