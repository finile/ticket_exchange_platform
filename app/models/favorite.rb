class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :ticket, optional: true
  belongs_to :railticket, optional: true
  belongs_to :coupon, optional: true

end
