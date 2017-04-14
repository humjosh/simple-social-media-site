class TopicTest < ActiveSupport::TestCase
    test "topic IDs are auto-incrementing" do
        # arrange
        topic_1 = Topic.new("content")

        # act
        topic_2 = Topic.new("more content")

        # assert
        assert_equal topic_1.id + 1, topic_2.id
    end
end
    