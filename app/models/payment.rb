class Payment < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :rail_order, optional: true

end
