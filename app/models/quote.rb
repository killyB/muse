class Quote < ActiveRecord::Base
	
	def self.pull_tweets
		t = TwitterHelper.get_client
		t.favorites(since_id: maximum(:tweet_id)).each do |tweet|
			unless exists?(tweet_id: tweet.id)
				create!(
					tweet_id: tweet.id,
					content: tweet.text,
					screen_name: tweet.user.screen_name,
				)
			end
		end


	end
end
