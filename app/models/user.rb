class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments

  def self.from_ominath(auth)
  	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)  	
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = 	auth["uid"]
  		user.name = 	auth["info"]["nickname"]
	end
  end
end
