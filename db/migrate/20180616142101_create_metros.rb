class CreateMetros < ActiveRecord::Migration[5.1]
  def change
    create_table :metros do |t|
      add_column :searches, :ticket_type, :string
      add_column :searches, :days, :string
      add_column :searches, :area, :string
      add_column :searches, :expire_date, :date
      t.timestamps
    end
  end
end
