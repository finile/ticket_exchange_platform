class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  after_create :subscribe_job
  # validates_presence_of :name

  has_many :tickets, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :railtickets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comboards, dependent: :destroy


  has_many :favorites, dependent: :destroy
  has_many :favorited_tickets, through: :favorites, source: :ticket
  has_many :favorited_railtickets, through: :favorites, source: :railticket
  has_many :favorited_coupons, through: :favorites, source: :coupon




  # for FB log in
  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
  end

  # for admin role checking
  def admin?
    self.role == "admin"
  end

  def mailchimp_list_id
    mailchimp_list_id = Rails.application.secrets.mailchimp_list_id
  end

# def
#   Gibbon::API = Gibbon::API.new
# end

private

  def subscribe_user_to_mailing_list
    SubscribeJob.perform_later(self)
  end

end
