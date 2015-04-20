class Diary < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy

  #validates_presence_of :slug

  #make dash urls
  # def slug
  #   title.downcase.gsub(" ", "-")
  # end

  

  

  def dash_slug
    title_dash = title.downcase.gsub(" ", "-")

    title_dash.gsub("à", "a").gsub("á", "a").gsub("ạ", "a").gsub("ả", "a").gsub("ã", "a").gsub("â","a").gsub("ầ","a").gsub("ấ", "a").gsub("ậ", "a").gsub("ẩ", "a").gsub("ẫ", "a").gsub("ă", "a").gsub("ằ", "a").gsub("ắ", "a").gsub("ặ", "a").gsub("ẳ", "a").gsub("ẵ", "a").gsub("è", "e").gsub("é", "e").gsub("ẹ", "e").gsub("ẻ", "e").gsub("ẽ", "e").gsub("ê", "e").gsub("ề", "e").gsub("ế", "e").gsub("ệ", "e").gsub("ể", "e").gsub("ễ", "e").gsub("ì", "i").gsub("í", "i").gsub("ị", "i").gsub("ỉ", "i").gsub("ĩ", "i").gsub("ò", "o").gsub("ó", "o").gsub("ọ", "o").gsub("ỏ", "o").gsub("õ", "o").gsub("ô", "o").gsub("ồ", "o").gsub("ố", "o").gsub("ộ", "o").gsub("ổ", "o").gsub("ỗ", "o").gsub("ơ", "o").gsub("ờ", "o").gsub("ớ", "o").gsub("ợ", "o").gsub("ở", "o").gsub("ỡ", "o").gsub("ù", "u").gsub("ú", "u").gsub("ụ", "u").gsub("ủ", "u").gsub("ũ", "u").gsub("ư", "u").gsub("ừ", "u").gsub("ứ", "u").gsub("ự", "u").gsub("ử", "u").gsub("ữ", "u").gsub("ỳ", "y").gsub("ý", "y").gsub("ỵ", "y").gsub("ỷ", "y").gsub("ỹ", "y").gsub("đ", "d").gsub("À", "A").gsub("Á", "A").gsub("Ạ", "A").gsub("Ả", "A").gsub("Ã", "A").gsub(" ", "A").gsub("Ầ", "A").gsub("Ấ", "A").gsub("Ậ", "A").gsub("Ẩ", "A").gsub("Ẫ", "A").gsub("Ă", "A").gsub("Ằ", "A").gsub("Ắ", "A").gsub("Ặ", "A").gsub("Ẳ", "A").gsub("Ẵ", "A").gsub("È", "E").gsub("É", "E").gsub("Ẹ", "E").gsub("Ẻ", "E").gsub("Ẽ", "E").gsub("Ê", "E").gsub("Ề", "E").gsub("Ế", "E").gsub("Ệ", "E").gsub("Ể", "E").gsub("Ễ", "E").gsub("Ì", "I").gsub("Í", "I").gsub("Ị", "I").gsub("Ỉ", "I").gsub("Ĩ", "I").gsub("Ò", "O").gsub("Ó", "O").gsub("Ọ", "O").gsub("Ỏ", "O").gsub("Õ", "O").gsub("Ô", "O").gsub("Ồ", "O").gsub("Ố", "O").gsub("Ộ", "O").gsub("Ổ", "O").gsub("Ỗ", "O").gsub("Ơ", "O").gsub("Ờ", "O").gsub("Ớ", "O").gsub("Ợ", "O").gsub("Ở", "O").gsub("Ỡ", "O").gsub("Ù", "U").gsub("Ú", "U").gsub("Ụ", "U").gsub("Ủ", "U").gsub("Ũ", "U").gsub("Ư", "U").gsub("Ừ", "U").gsub("Ứ", "U").gsub("Ự", "U").gsub("Ử", "U").gsub("Ữ", "U").gsub("Ỳ", "Y").gsub("Ý", "Y").gsub("Ỵ", "Y").gsub("Ỷ", "Y").gsub("Ỹ", "Y").gsub("Đ", "D")  
    
  end

  def to_param
    "#{id}-#{dash_slug}"
  end
end
