class BloggersController < ApplicationController
	def index
		@bloggers = Blogger.all
	end
	def new
		@blogger = Blogger.new
	end
	def create
		@blogger = Blogger.new(strong_params(:name, :bio, :age))
		if @blogger.save
			redirect_to @blogger
		else
			render :new
		end
	end
	def show
		@blogger = get_instance
		@total_likes = @blogger.total_likes
		@featured_post = @blogger.featured_post
		@top_destinations = @blogger.top_destinations
	end

	private
	
	def get_instance
		Blogger.find(params[:id])
	end
	def strong_params(*args)
		params.require(:blogger).permit(*args)
	end
end