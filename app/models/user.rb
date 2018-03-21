class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :railtickets, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_tickets, through: :favorites, source: :ticket
  has_many :favorited_railtickets, through: :favorites, source: :railticket

  def admin?
    self.role == "admin"
  end

end
