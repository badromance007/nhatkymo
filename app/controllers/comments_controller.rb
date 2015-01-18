class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id 
    @comment.diary_id = @diary.id

    if @comment.save
      redirect_to diary_path(@diary)
    else
      render 'new'
    end
  end
end
