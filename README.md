# README

This app is a simple social media site, where you can create topics and vote them up or down. It is written in Ruby on Rails, however it uses an in memory data structure instead of a database.

It is deployed on Heroku at https://humber-social-media-demo.herokuapp.com/

## Design choices

### TopicStore

The topics are being stored in a Hash. The advantages are:

* A topic with a given ID can be looked up in O(1) time
* Inserting a new topic takes O(1) time

The disadvantages are:

* Hash is unordered, so it must be sorted whenever we request the top 20. Ruby sorts using a variant of quicksort, which takes O(nlog(n)) time.
    *  I considered using a binary tree to implement the TopicStore. This would reduce the complexity of the get_top_20 method because the results would already be sorted. The downsides are that inserts and reads are slower, plus Ruby does not have a good implementation in the standard library, and writing one from scratch for this simple application would be overkill.