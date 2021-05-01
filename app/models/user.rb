class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_and_belongs_to_many :groups
  has_many :friendships
  has_many :items
  has_many :orders
  has_and_belongs_to_many :orders

  has_many :notifications, foreign_key: :recipient_id
  has_many :notifications, foreign_key: :actor_id

  has_one_attached :avatar

  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.connect_to_gmail(auth, signed_in_resource=nil)
    puts "------>>>>>" 
    puts auth.info
    puts "------<<<<<" 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          full_name:auth.info.name,
          provider:auth.provider, uid:auth.uid, email:auth.info.email,
          image:auth.info.image, password:Devise.friendly_token[0,20],
        )
      end
    end
  end  
end
