class AddTicketIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :ticket_id, :integer
  end
end
