class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.date :date
      t.references :user, index: true
      t.timestamps
    end
  end
end
