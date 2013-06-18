get '/' do
  erb :index
end

get '/:username' do
  username = params[:username]
  tweets = if Tweet.find_all_by_author(username).any?
    if Tweet.stale(Tweet.find_all_by_author(username))
      Tweet.destroy_all(author: username)
      Tweet.save_all(Tweet.grab_ten(username))
    else
      Tweet.grab_ten(username)
    end
  else
    Tweet.grab_ten(username)
  end
  erb :_tweets, locals: { tweets: tweets }, layout: false
end
