class CommentsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user_comment, only: :destroy
	
	def create

		@comment = current_user.comments.build(comment_params)
		if @comment.save
			redirect_to request.referrer || root_url
		else
			flash[:danger] = "Can't blank comment!"
			redirect_to request.referrer || root_url
			end
	end
	def new
		@comment = Comment.new
		
	end

	def show
	end
	def destroy
		@comment.destroy
		flash[:success] = "Deleted comment."
		redirect_to request.referrer || root_url
	end


	private

	def comment_params
		params.require(:comment).permit(:entry_id, :context)
		
	end

	def correct_user_comment
    	@comment = current_user.comments.find_by(id: params[:id])
    	redirect_to root_url if @comment.nil?
    end

end

