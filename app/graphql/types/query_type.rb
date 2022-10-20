module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :breweries, [Types::BreweryType], null: false do
      argument :location, String, required: true
      argument :radius, String, required: true
      argument :style, String, required: true
    end 

    def breweries(location:, radius:, style:)
      brewery_location = MapService.get_location(location)
      lat = brewery_location[:results].first[:locations].first[:latLng][:lat]
      lon = brewery_location[:results].first[:locations].first[:latLng][:lng]
      find_breweries = CatalogFacade.breweries(lat, lon, radius)
      breweries_that_match_style_and_their_beers = CatalogFacade.brewer_beers(find_breweries, style)
    end
  end
end