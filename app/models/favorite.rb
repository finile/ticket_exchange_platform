class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :ticket, optional: true, counter_cache: true
  belongs_to :railticket, optional: true, counter_cache: true
  belongs_to :coupon, optional: true, counter_cache: true

end
