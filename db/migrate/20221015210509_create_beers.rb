class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :catalog_beer_id
      t.string :name
      t.string :style
      t.string :description
      t.float :abv
      t.integer :ibu
      t.string :catalog_brewery_id
      t.integer :last_modified
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
