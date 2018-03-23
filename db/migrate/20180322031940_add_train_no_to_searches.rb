class AddTrainNoToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :train_no, :string
  end
end
