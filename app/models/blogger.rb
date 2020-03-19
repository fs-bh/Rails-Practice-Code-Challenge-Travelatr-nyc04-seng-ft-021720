class Blogger < ApplicationRecord
	has_many :posts
	has_many :destinations, through: :posts

	def top_destinations
		# update this
		self.destinations.take(5)
	end
	def total_likes
		#update this
		13
	end
	def featured_post
		random_post
	end

	private

	def random_post
		self.posts.sample
	end
	def post_with_most_likes
		# tbd
	end
end
