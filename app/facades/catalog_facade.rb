class CatalogFacade
  class << self
    def breweries(lat, long, radius)
      json = CatalogService.get_breweries(lat, long, radius)

      brewery_objects = json[:data].map  do |breweries|
        Bar.new(breweries) 
      end

      brewery_objects.map do |brewery_object|
        Brewery.create!(address: brewery_object.address, name: brewery_object.name, catalog_brewery_id: brewery_object.catalog_brewery_id, distance_from_user: brewery_object.distance_from_user, website: brewery_object.website, facebook: brewery_object.facebook, instagram: brewery_object.instagram, twitter: brewery_object.twitter, brewery_description: brewery_object.brewery_description)
      end
    end
  end
end