class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.date :dob
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
