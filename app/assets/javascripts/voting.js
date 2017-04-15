// Upvoting instantly updates the vote count displayed next to a topic, giving
// the user feedback that their vote has been made successfully. The implementation
// here is very basic - for example, it does not handle API errors or prevent the
// user from voting multiple times.

(function() {
    $(document).ready(function() {
        var topics = $('.topic');
        topics.each(function() {
            initialiseVoteButtons(this);
        });

        function initialiseVoteButtons(topicRow) {
            var upvoteButton = $(topicRow).find('[data-vote-type="up"]');
            var downvoteButton = $(topicRow).find('[data-vote-type="down"]');
            var scoreElement = $(topicRow).find('.score');

            upvoteButton.click(function() {
                postUpvote(
                    $(this).data('id'),
                    function(data) {
                        scoreElement.text(data.score);
                    });
            });

            downvoteButton.click(function() {
                postDownvote(
                    $(this).data('id'),
                    function(data) {
                        scoreElement.text(data.score);
                    });
            });
        }

        function postUpvote(id, callback) {
            var url = '/api/topics/' + id + '/upvote';
            $.post(url, callback);
        }

        function postDownvote(id, callback) {
            var url = '/api/topics/' + id + '/downvote';
            $.post(url, callback);
        }
    });
})();