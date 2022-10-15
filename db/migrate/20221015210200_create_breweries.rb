class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :catalog_brewery_id
      t.string :name
      t.string :address
      t.integer :distance_from_user
      t.string :website
      t.string :instagram
      t.string :facebook
      t.string :twitter
      t.string :brewery_description

      t.timestamps
    end
  end
end
