class DestinationsController < ApplicationController
	# def index
	# 	@destinations = Destination.all
	# end
	# def new
	# 	@destination = Destination.new
	# end
	# def create
	# 	destination = Destination.new(strong_params(:name, :country))
	# 	if destination.save
	# 		redirect_to destination
	# 	else
	# 		render :new
	# 	end
	# end
	def show
		@destination = get_instance
		@total_likes = @destination.total_likes		
		@average_blogger_age = @destination.average_blogger_age
		@featured_post = @destination.featured_post
		@recent_posts = @destination.recent_posts
	end

	private
	
	def get_instance
		Destination.find(params[:id])
	end
	def strong_params(*args)
		params.require(:destination).permit(*args)
	end
end