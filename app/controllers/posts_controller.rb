class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(strong_params(:title, :content, :blogger_id, :destination_id))
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end
	def show
		@post = get_instance

		# parse the json into a standard string for the view
		# require 'json'
		# @post_content = JSON.parse(@post.content)[0]

		# above is erroring if not JSON
		@post_content = @post.content
	end

	private
	
	def get_instance
		Post.find(params[:id])
	end
	def strong_params(*args)
		params.require(:post).permit(*args)
	end
end