class Railticket < ActiveRecord::Base

  belongs_to :user, counter_cache: true

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :rail_cart_items, dependent: :destroy
  has_many :rail_carts, through: :rail_cart_items


  has_many :comments, :as => :commentable

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

end


