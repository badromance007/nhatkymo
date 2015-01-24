class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  def show
    @user_diaries = Diary.where(user_id: find_user).order("created_at desc")
     
    gon.user_diaries_urls = []
    @user_diaries.each do | user_diary | 
      gon.user_diaries_urls << diary_url(user_diary).to_s
    end
  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
