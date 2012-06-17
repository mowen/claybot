class TweetFilter

  def self.allow?(tweet)
    text = tweet[:text]
    re_with_slash = %r{clay\s*/\s*davis}i
    text =~ re_with_slash ? false : true
  end
  
end
