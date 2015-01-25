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

    # second time
    url_commented_ons = []
    @user_diaries.each do |diary |
      url_commented_ons << diary_url(diary)
    end

    fb_comments_urls = []
    url_commented_ons.each do | url |
      fb_comments_urls << "https://graph.facebook.com/v2.1/?fields=share{comment_count}&id="+url
    end
    fb_comments_jsons = []
    fb_comments_urls.each do | graph_url |
      fb_comments_jsons << open(graph_url).read
    end
    fb_comments_datas = []
    fb_comments_jsons.each do | graph_url_json |
      fb_comments_datas << ActiveSupport::JSON.decode(graph_url_json)
    end

    @fb_comments_number = 0
    # get the number of comments
    fb_comments_datas.each do | data | 
      if data.length > 1
        @fb_comments_number += data["share"]["comment_count"].to_i
      end
    end
    



  end

  private

    def find_user
      @user = User.find(params[:id])
    end
end
