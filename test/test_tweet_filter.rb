require 'test/unit'
require 'shoulda'

require 'tweet_filter'

class TestTweetFilter < Test::Unit::TestCase
  context "a tweet filter" do

    setup do
      @tweet = {}
    end
    
    should "not allow tweets about Clay/Davis" do
      @tweet[:text] = "Clay/Davis is a campus at Transylvania University."
      assert_equal false, TweetFilter.allow?(@tweet)
    end

    should "allow tweets about Clay Davis" do
      @tweet[:text] = "Clay Davis is a naughty senator. Shiiieeet!"
      assert_equal true, TweetFilter.allow?(@tweet)
    end

  end
end
