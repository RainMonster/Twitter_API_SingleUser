get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = find_or_create_twitteruser(params[:username])
  if @user.tweets.empty?
    fetch_tweets(@user)
  elsif tweets_stale?(@user) 
    @user.tweets.delete_all
    fetch_tweets(@user)
  else
    @user.tweets
  end

  @tweets = @user.tweets.limit(10)
  erb :index
end
