class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id


        if comment.save
            render "messages/create"
        else

    end

    def comment_params
        params.require(:comment).permit(:message, :post_id)
    end
end