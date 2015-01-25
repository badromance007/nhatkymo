class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  def show
    @user_diaries = Diary.where(user_id: find_user).order("created_at desc")
     

    #first time
    url_commented_on = "http://nhatkymo.herokuapp.com/diaries/23"
    fb_comments_url = "https://graph.facebook.com/v2.1/?fields=share{comment_count}&id="+url_commented_on
    fb_comments_json = open(fb_comments_url).read
    fb_comments_data = ActiveSupport::JSON.decode(fb_comments_json)

    # get the number of comments
    @fb_comments = fb_comments_data["share"]["comment_count"]

    
    



  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
