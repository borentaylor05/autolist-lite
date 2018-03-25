class AddViewCountToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :view_count, :integer, default: 0
  end
end
