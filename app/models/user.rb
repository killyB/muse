#  def self.from_ominath(auth)
#    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)    
#  end
#
#  def self.create_from_omniauth(auth)
#    create! do |user|
#      user.provider = auth["provider"]
#      user.uid =  auth["uid"]
#      user.name =   auth["info"]["nickname"]
#    end
#  end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_many :authentications
  has_many :posts_with_comments, :through => :comments, :source => :post
  has_many :posts
  has_many :comments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:nickname]
      user.email = auth[:info][:email] 
      user.password = "password1"
      user.twitterURL = auth[:info][:url]
      user.save
    end
  end

end
