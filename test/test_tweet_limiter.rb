require 'test/unit'
require 'shoulda'

require 'tweet_limiter'

class TestTweetLimiter < Test::Unit::TestCase
  context "a tweet limiter with a tweet recipient" do
    
    setup do
      @recipient = '@martinowen'
      @period = 3600
      @now = Time.new(2012, 6, 16, 16, 38, 0)
      @limiter = TweetLimiter.new(@period, {}, @now)
      @limiter.add_recipient(@recipient)
    end

    should "know about the recipient" do
      assert_equal @now, @limiter.recipients[@recipient]
    end

    should "not let the recipient receive a tweet within the period" do
      assert_equal false, @limiter.can_receive_tweet?(@recipient)
    end

    should "let the recipient receive another tweet after the period" do
      recipients = @limiter.recipients
      future_now = @now + (@period * 2)
      future_limiter = TweetLimiter.new(@period, recipients, future_now)

      assert_equal true, future_limiter.can_receive_tweet?(@recipient)
    end
    
  end
end
