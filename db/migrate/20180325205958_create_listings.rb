class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :vin
      t.string :make
      t.string :model
      t.integer :year
      t.string :primary_photo_url

      t.timestamps
    end
  end
end
