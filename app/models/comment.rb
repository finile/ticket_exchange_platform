class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :railticket, optional: true
  belongs_to :ticket, optional: true
  belongs_to :coupon
  belongs_to :board


end
