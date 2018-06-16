class AddColumnToSearchTable < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :ticket_type, :string
    add_column :searches, :days, :string
    add_column :searches, :area, :string
    add_column :searches, :expire_date, :date
  end
end
