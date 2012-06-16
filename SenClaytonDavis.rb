#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'
require File.join(File.dirname(__FILE__), 'sheeeiiit')

# remove this to send out tweets
#debug_mode
# remove this to update the db
#no_update

# remove this to get less output when running
verbose

# here's a list of users to ignore
blacklist "claydavis", "wireclaydavis", "sheeeeeeeeeeeit", "Sen_Clay_Davis"

# here's a list of things to exclude from searches
exclude "hi", "spammer", "junk"

search('"clay davis"') do |tweet|
  user = tweet_user(tweet)
  sheeeiiit = Sheeeiiit.generate
  reply "#{user} #{sheeeiiit}", tweet
end
