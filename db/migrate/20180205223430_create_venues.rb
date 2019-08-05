class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :size
      t.string :description
      t.string :city_id

      t.timestamps
    end
  end
end
