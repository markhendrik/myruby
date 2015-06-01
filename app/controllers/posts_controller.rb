class PostsController < ApplicationController
	def index
		@search = Post.search(params[:search])
		@posts = @search.all
	end
	
	def show
		@post = Post.find(params[:id])
		@user = AdminUser.all
		@post_comment = PostComment.new(:post => @post)
	end

	def new
		@post = Post.new
		@category = Catergory.all	
	end
	
	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved"
		else
			render "new"
		end 
	end
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to post_path, :notice =>"You post has been updated"
		else
			render "edit"
		end 
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice =>"Your post has been deleted"
	end	
	
end
