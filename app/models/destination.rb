class Destination < ApplicationRecord
	has_many :posts
	has_many :bloggers, through: :posts

	validates :name, uniqueness: true

	def recent_posts
		self.posts
			.sort_by{ |post| post.updated_at }
			.reverse
			.take(5)
	end
	def average_blogger_age
		self.bloggers.map{|blogger| blogger.age}.sum / (1.0 * self.bloggers.count)
	end
	def featured_post
		random_post
	end
	def total_likes
		self.posts.map{|post| post.likes}.sum
	end


	private

	def random_post
		self.posts.sample
	end
	def post_with_most_likes
		# tbd
	end
end
