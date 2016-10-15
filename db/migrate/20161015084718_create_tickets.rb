class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.string :subject
      t.string :status
      t.text :content

      t.timestamps
    end
  end
end
