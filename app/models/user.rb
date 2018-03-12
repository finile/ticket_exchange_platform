class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :favorites, dependent: :destroy
   has_many :favorited_tickets, through: :favorites, source: :ticket

  has_many :comments


  def admin?
    self.role == "admin"
  end

end
