class CreatePerformances < ActiveRecord::Migration[5.1]
  def change
    create_table :performances do |t|
      t.integer :artist_id
      t.integer :venue_id
      t.string :show_type
      t.boolean :sold_out
      t.datetime :date
      t.decimal :ticket_price
      t.integer :duration

      t.timestamps
    end
  end
end
