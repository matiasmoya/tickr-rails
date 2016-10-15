class AddClosedToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :closed, :boolean, default: false
  end
end
