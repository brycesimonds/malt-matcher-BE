# frozen_string_literal: true

module Types
  class BreweryType < Types::BaseObject
    field :name, String, null: true
    field :address, String, null: true 
    field :distance_from_user, Integer, null: true 
    field :social_medias, String, null: true
    field :brewery_description, String, null: true
    # field :brewery_id, String, null: true 
  end
end


