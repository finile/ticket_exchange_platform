class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :ticket, counter_cache: true

  belongs_to :user
  belongs_to :railticket, counter_cache: true
end
