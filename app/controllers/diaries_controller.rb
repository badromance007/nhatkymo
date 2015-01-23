class DiariesController < ApplicationController
  before_action :find_diary, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  def index
    #@diaries = Diary.where(user_id: current_user)# for display only diaries belong to the user!!!
    # for display all the diaries "Diary.all.order("created_at DESC")"
    @diaries = Diary.all.order("created_at DESC")
  end

  def mydiaries
    @user_diaries = Diary.where(user_id: current_user).order("created_at desc")
  end

  def gopy
  end

  def huongdan
  end

  def show
    @comments = Comment.where(diary_id: @diary)
    @random_diaries = Diary.where.not(id: @diary).order("RANDOM()").limit(3)
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)

    if @diary.save
      redirect_to @diary 
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to @diary
    else
      render 'edit'
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path
  end

  def upvote
    @diary.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @diary.downvote_by current_user
    redirect_to :back
  end

  private

    def find_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:title, :content)
    end
end
