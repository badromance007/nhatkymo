class DiariesController < ApplicationController
  before_action :find_diary, only: [:show, :edit, :update, :destroy]
  def index
    @diaries = Diary.all.order("created_at DESC")
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)

    if @diary.save
      redirect_to @diary 
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def find_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:title, :content)
    end
end
