class Diary < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :slug

  #make dash urls
  # def slug
  #   title.downcase.gsub(" ", "-")
  # end

  def to_param
    slug
  end
end
