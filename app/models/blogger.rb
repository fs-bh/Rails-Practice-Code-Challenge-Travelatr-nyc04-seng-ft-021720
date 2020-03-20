class Blogger < ApplicationRecord
	has_many :posts
	has_many :destinations, through: :posts

	validates :name, uniqueness: true
	validates :age, numericality: { greater_than: 0 }
	validates :bio, length: { minimum: 31 }

	def top_destinations
		self.destinations
			.group(:id)
			.sort_by{ |destination|	num_of_posts_about_destination(destination)	}
			.reverse
			.first(5)
	end
	
	def num_of_posts_about_destination(destination)
		self.posts.select{ |post|
			post.destination == destination
		}.count
	end
	def total_likes
		self.posts.map{ |post| post.likes }.sum
	end
	def featured_post
		post_with_most_likes
	end

	private

	def random_post
		self.posts.sample
	end
	def post_with_most_likes
		self.posts.sort_by{ |post| post.likes }.reverse[0]
	end
end
