class PostCommentsController < InheritedResources::Base
	def create
		@post_comment = PostComment.new(params[:post_comment])

		if @post_comment.save
			flash[:notice] = 'Comment was successfully created.'
			redirect_to(@post_comment.post)
		else
			flash[:notice] = "Error creating post_comment:"
			redirect_to(@post_comment.post)
		end
	end
end

