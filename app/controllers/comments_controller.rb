class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_comment, only: %i[ update destroy ]

    def create
        @comment = @post.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:notice] = "Comment successfully created"
            redirect_to @post
        else
            flash[:alert] = "Comment has not been created"
            redirect_to @post
        end
    end

    def update
        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to @post, notice: "Comment was successfully updated" }
            else
                format.html { redirect_to @post, alert: "Something went wrong :(" }
            end
        end
    end
    
    

    def destroy
        if @comment.destroy
            flash[:notice] = 'Comment was successfully deleted.'
            redirect_to @post
        else
            flash[:alert] = 'Something went wrong'
            redirect_to @post
        end
    end
    
    private

    def set_comment
        @comment = @post.comments.find(params[:id])
    end
    
    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
