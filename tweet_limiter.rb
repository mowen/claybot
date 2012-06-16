class TweetLimiter
  attr_reader :config

  @@config_key = :recipients
  
  def initialize(config, period, now = Time.now)
    @config, @period, @now = config, period, now
    @config[@@config_key] ||= {}
  end

  def refresh_recipients!
    one_hour_ago = @now - @period

    new_recipients = Hash.new
    @config[@@config_key].each do |k,v|
      unless v < one_hour_ago
        new_recipients[k] = v
      end
    end

    @config[@@config_key] = new_recipients
  end

  def can_receive_tweet?(user)
    !@config[@@config_key].has_key?(user)
  end
  
  def add_recipient(user)
    @config[@@config_key][user] = @now    
  end
  
end
