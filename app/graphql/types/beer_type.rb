# frozen_string_literal: true

module Types
  class BeerType < Types::BaseObject
    field :name, String, null: true 
    field :style, String, null: true 
    field :description, String, null: true 
    field :abv, Float, null: true 
    field :ibu, Integer, null: true 
    field :last_modified, String, null: true
  end
end

# GET http://www.mapquestapi.com/geocoding/v1/address
# GET https://api.catalog.beer/location/nearby?latitude={latitude}&longitude={longitude} - find nearby location(catalog)
# GET https://api.catalog.beer/brewer/{brewery_id}/beer - 
# GET https://api.catalog.beer/beer/{beer_id} - retrieve a beer(catalog)
