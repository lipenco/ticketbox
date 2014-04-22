class User < ActiveRecord::Base
  has_many :tickets

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email ||= auth[:info][:email] if auth[:info][:email]
      user.image = auth['info']['image'].sub("_normal", "") if auth['provider'] == 'twitter'
    end
  end

end
