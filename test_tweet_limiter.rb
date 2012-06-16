require 'test/unit'
require 'shoulda'

require File.join(File.dirname(__FILE__), 'tweet_limiter')

class TestTweetLimiter < Test::Unit::TestCase
  context "a tweet limiter with a tweet recipient" do
    
    setup do
      @recipient = '@martinowen'
      @period = (60*60)
      @now = Time.new(2012, 6, 16, 16, 38, 0)
      @limiter = TweetLimiter.new({}, @period, @now)
      @limiter.add_recipient(@recipient)
    end

    should "know about the recipient" do
      assert_equal @now, @limiter.config[:recipients][@recipient]
    end

    should "not let the recipient receive a tweet within the period" do
      assert_equal false, @limiter.can_receive_tweet?(@recipient)
    end

    should "let the recipient receive another tweet after the period" do
      config = @limiter.config
      future_now = @now + (@period * 2)
      future_limiter = TweetLimiter.new(config, @period, future_now)
      future_limiter.refresh_recipients!
      assert_equal true, future_limiter.can_receive_tweet?(@recipient)
    end
    
  end
end
