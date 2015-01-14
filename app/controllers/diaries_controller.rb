class DiariesController < ApplicationController
  before_action :find_diary, only: [:show, :edit, :update, :destroy]
  def index
    @diaries = Diary.where(user_id: current_user)# for display only diaries belong to the user!!!
    # for display all the diaries "Diary.all.order("created_at DESC")"
  end

  def show
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

  private

    def find_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:title, :content)
    end
end