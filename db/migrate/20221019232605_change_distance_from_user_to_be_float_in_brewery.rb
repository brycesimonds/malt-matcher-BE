class ChangeDistanceFromUserToBeFloatInBrewery < ActiveRecord::Migration[5.2]
  def change
    change_column :breweries, :distance_from_user, :float
  end
end