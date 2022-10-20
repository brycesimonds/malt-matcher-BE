# frozen_string_literal: true

module Types
  class BreweryType < Types::BaseObject
    field :name, String, null: true
    field :address, String, null: true 
    field :distance_from_user, Float, null: true 
    field :website, String, null: true
    field :instagram, String, null: true
    field :facebook, String, null: true
    field :twitter, String, null: true
    field :brewery_description, String, null: true
    field :catalog_brewery_id, String, null: true 
    field :beers, [BeerType], null: true
  end
end


