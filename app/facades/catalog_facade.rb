class CatalogFacade
  class << self
    def breweries(lat, long, radius)
      json = CatalogService.get_breweries(lat, long, radius)

      brewery_objects = json[:data].map  do |breweries|
        Bar.new(breweries) 
      end

      brewery_objects.map do |brewery_object|
        Brewery.find_or_create_by(address: brewery_object.address, name: brewery_object.name, catalog_brewery_id: brewery_object.catalog_brewery_id, distance_from_user: brewery_object.distance_from_user, website: brewery_object.website, facebook: brewery_object.facebook, instagram: brewery_object.instagram, twitter: brewery_object.twitter, brewery_description: brewery_object.brewery_description)
      end
    end

    def brewer_beers(brewery_objects, style)
      breweries_that_have_style_of_beer = []
      brewery_objects.each do |brewery_data| 
          brewer_beers_json = CatalogService.get_beers(brewery_data.catalog_brewery_id)
          
          wip2 = brewer_beers_json[:data].map do |beer|
            beer[:style].include?(style)
          end 

          if wip2.include?(true)
            breweries_that_have_style_of_beer << brewery_data
          end
        end
        breweries_that_have_style_of_beer.map do |brewery_object|
          the_brewerys_beers = CatalogService.get_beers(brewery_object.catalog_brewery_id)
          array_of_beer_objects = the_brewerys_beers[:data].map do |beer_data|
            single_beer_abv_ibu = CatalogService.get_abv_ibu(beer_data[:id])
            Drink.new(beer_data, single_beer_abv_ibu)
          end      
          array_of_beer_objects.map do |beer_object|
            Beer.find_or_create_by(catalog_beer_id: beer_object.catalog_beer_id, name: beer_object.name, style: beer_object.style, description: beer_object.description, abv: beer_object.abv, ibu: beer_object.ibu, catalog_brewery_id: beer_object.catalog_brewery_id, last_modified: beer_object.last_modified, brewery_id: brewery_object.id)
          end
        end
        return breweries_that_have_style_of_beer
      end
    end
  end
