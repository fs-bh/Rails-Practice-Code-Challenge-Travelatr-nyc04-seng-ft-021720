class Destination < ApplicationRecord
	has_many :posts
	has_many :bloggers, through: :posts

	def recent_posts
		# update this
		self.posts.take(5)
	end
	def average_blogger_age
		# update this
		25.2
	end
	def featured_post
		random_post
	end
	def total_likes
		# update this
		192
	end


	private

	def random_post
		self.posts.sample
	end
	def post_with_most_likes
		# tbd
	end
end
