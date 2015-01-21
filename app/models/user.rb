class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :diaries, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :image_avatar, :styles => { :medium => "500x500#", :small => "50x50#" }, :default_url => "placeholder.png"
  validates_attachment_content_type :image_avatar, :content_type => /\Aimage\/.*\Z/


  #for facebook login
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      user.profile_url = auth.info.urls.send(auth.provider.capitalize) #to capitalize the first character of provider
    end
  end

  # opies the facebook or google email if available
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end

      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  #for google login
  def self.find_for_google_oauth2(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      user.profile_url = auth.extra.raw_info.profile 
    end
  end
end
