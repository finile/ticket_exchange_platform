class CreateMetros < ActiveRecord::Migration[5.1]
  def change
    create_table :metros do |t|

      t.timestamps
    end
  end
end
