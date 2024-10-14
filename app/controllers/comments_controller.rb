class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @comment = @post.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:notice] = "Comment successfully created"
            redirect_to @post
        else
            flash[:error] = "Comment has not been created"
            redirect_to @post
        end
    end
    

    def destroy
        @comment = @post.comments.find(params[:id])
        if @comment.destroy
            flash[:notice] = 'Comment was successfully deleted.'
            redirect_to @post
        else
            flash[:error] = 'Something went wrong'
            redirect_to @post
        end
    end
    
    private
    
    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
