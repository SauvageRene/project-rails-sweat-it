class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :github]
    has_many :communities, through: :subscriptions
    has_many :posts
    has_many :comments


   

    def full_name
      "#{first_name} #{last_name}"
    end

    def self.from_omniauth(auth)

      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        binding.pry
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.password = Devise.friendly_token[0,20]
        # user.name = auth.info.name
        
      end
    end
  
end
