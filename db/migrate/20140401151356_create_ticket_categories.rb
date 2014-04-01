class CreateTicketCategories < ActiveRecord::Migration
  def change
    create_table :ticket_categories do |t|
      t.references :ticket, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
