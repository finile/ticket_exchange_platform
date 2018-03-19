class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  belongs_to :user
  belongs_to :railticket

end
