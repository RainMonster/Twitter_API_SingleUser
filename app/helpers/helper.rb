helpers do 

  def timeline(user)
    @timeline = Twitter.user_timeline(user.username)
  end 


  def fetch_tweets(user)

    timeline(user)

    @timeline.each do |tweet|
      Tweet.create(status: tweet.text, twitter_user_id: user.id)
    end
  end


  def find_or_create_twitteruser(username)

    if TwitterUser.find_by_username(username) == nil 
      TwitterUser.create(username: username)
    else
      TwitterUser.find_by_username(username)
    end

  end


  def tweets_stale?(user)
    @timeline = timeline(user)
    user.tweets.first.created_at - @timeline.first.created_at < 10
  end

end
