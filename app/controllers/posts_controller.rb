class PostsController < ApplicationController
	def new
		@post = Post.new
		@bloggers = Blogger.all.sort_by{|b| b.name}
		@destinations = Destination.all.sort_by{|d| d.name}
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

		# parse the json into an array for the view
		require 'json'
		@post_content_paragraphs = JSON.parse(@post.content)

		# incase we have invalid JSON:
		rescue JSON::ParserError => e
			@post_content_paragraphs = [@post.content]
	end

	# add like to post
	def add_like
        @post = get_instance
        @post.likes += 1
        @post.save
        redirect_to @post		
	end

	private
	
	def get_instance
		Post.find(params[:id])
	end
	def strong_params(*args)
		params.require(:post).permit(*args)
	end
end