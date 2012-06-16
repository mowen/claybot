class TweetLimiter
  attr_reader :recipients
  
  def initialize(recipients, period = 3600, now = Time.now)
    @recipients, @period, @now = recipients, period, now
    refresh_recipients!
  end

  def can_receive_tweet?(user)
    !@recipients.has_key?(user)
  end
  
  def add_recipient(user)
    @recipients[user] = @now    
  end

  private

  def refresh_recipients!
    one_hour_ago = @now - @period

    new_recipients = {}
    @recipients.each do |k,v|
      unless v < one_hour_ago
        new_recipients[k] = v
      end
    end

    @recipients= new_recipients
  end
  
end
