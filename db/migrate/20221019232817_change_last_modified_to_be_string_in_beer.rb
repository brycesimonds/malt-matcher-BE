class ChangeLastModifiedToBeStringInBeer < ActiveRecord::Migration[5.2]
  def change
    change_column :beers, :last_modified, :string
  end
end
