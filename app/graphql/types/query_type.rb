module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :breweries, [Types::BreweryType], null: false do
      argument :location, String, required: true
      argument :radius, String, required: true
    end 

    def breweries(location:, radius:)
      brewery_location = MapService.get_location(location)
      lat = brewery_location[:results].first[:locations].first[:latLng][:lat]
      lon = brewery_location[:results].first[:locations].first[:latLng][:lng]
      find_breweries = CatalogFacade.breweries(lat, lon, radius)
    end
  end
end