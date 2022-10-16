class Beer < ApplicationRecord
  belongs_to :brewery

  validates_presence_of :catalog_beer_id
  validates_presence_of :name
  validates_presence_of :style
  validates_presence_of :description
  validates_presence_of :abv
  validates_presence_of :ibu
  validates_presence_of :catalog_brewery_id
  validates_presence_of :last_modified
end
