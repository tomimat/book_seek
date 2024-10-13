class CommentsController < ApplicationController
   def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = Book.find(params[:book_id]).id
    if @comment.save
      redirect_back(fallback_location: books_path)
    else
      redirect_back(fallback_location: books_path)
    end

   end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
