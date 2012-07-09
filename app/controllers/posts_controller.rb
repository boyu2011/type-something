class PostsController < ApplicationController
	
	before_filter :signed_in_user, only: [:create, :destroy]

	# prevent malicious users who executes hacking terminal command such as DELETE.
	before_filter :correct_user,   only: [:destroy]

	def index
	end

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "New post created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

		def correct_user
			@post = current_user.posts.find(params[:id])
		rescue
			redirect_to root_path
		end
end
