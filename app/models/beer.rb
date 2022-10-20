class Beer < ApplicationRecord
  belongs_to :brewery

  validates_presence_of :catalog_beer_id
  validates_presence_of :name
  validates_presence_of :style
  validates :description, presence: false 
  validates :ibu, presence: false 
  validates :abv, presence: false 
  validates_presence_of :catalog_brewery_id
  validates_presence_of :last_modified
end
