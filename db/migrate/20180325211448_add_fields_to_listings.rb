class AddFieldsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :price, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :mileage_humanized, :string
  end
end
