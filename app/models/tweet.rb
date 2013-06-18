class Tweet < ActiveRecord::Base

  def self.grab_ten(username)
    @tweets = Twitter.user_timeline(username, :count => 10)
  end

  def self.save_all(array)
    array.each do |tweet|
      Tweet.create(body: tweet.text, author: tweet.user.screen_name, tweet_created: tweet.created_at)
    end
    array
  end

  def self.stale(array)
    recent_times = Tweet.order('created_at DESC LIMIT 10').map(&:tweet_created).each_cons(2).map { |a, b| b-a }
    seconds_until_stale = (recent_times.reduce(:+)/recent_times.count).round
    youngest = array.min_by(&:created_at)
    Time.now - youngest.created_at > 10
  end
end

