class Beer < ApplicationRecord
  belongs_to :brewery

  validates_presence_of :catalog_beer_id
  validates_presence_of :name
  validates_presence_of :style
  validates_presence_of :description, allow_blank: true 
  validates_presence_of :ibu, allow_blank: true 
  validates_presence_of :abv, allow_blank: true 
  validates_presence_of :catalog_brewery_id
  validates_presence_of :last_modified
end
