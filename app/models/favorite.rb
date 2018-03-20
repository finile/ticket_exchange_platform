class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  belongs_to :railticket

end
