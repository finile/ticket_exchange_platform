class Ticket < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :comments

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
end
