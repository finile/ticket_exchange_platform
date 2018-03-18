class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets, dependent: :destroy
  has_many :coupons, dependent: :destroy

  def admin?
    self.role == "admin"
  end
  
end
