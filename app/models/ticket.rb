class Ticket < ApplicationRecord

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :comments, dependent: :destroy

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
end
