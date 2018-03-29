class Coupon < ApplicationRecord
  mount_uploader :image, TicketImageUploader 
  belongs_to :user, counter_cache: true

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  has_many :comments, :as => :commentable



  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

end


