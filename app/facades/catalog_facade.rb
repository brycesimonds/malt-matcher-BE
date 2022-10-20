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

    def brewer_beers(brewery_collection, style)
      answer = []
      brewery_collection.each do |brewery_data| 
          brewer_beers_json = CatalogService.get_beers(brewery_data.catalog_brewery_id)
          
          wip2 = brewer_beers_json[:data].map do |beer|
            beer[:style].include?(style)
          end 

          if wip2.include?(true)
            answer << brewery_data
          end
        end
       #answer.count is giving us 4 brewery objects here
                  #now we need to send answer to the get_abv_ibu then
                  #turn them into Drinks and save them to DB

      # brewer_beer_objects = json[:data].map do |brewer_beer|
      #   beer_abv_ibu = CatalogService.get_abv_ibu(beer_id)
      #   #if beer_abv_ibu style logic
      #   Drink.new(brewer_beer, beer_abv_ibu)
      # end

      # brewer_beer_objects.map do |brewer_beer|
      #   Drink.find_or_create_by(catalog_brewery_id: brewer_beer.catalog_brewery_id, name: brewer_beer.name, style: brewer_beer.style, description: brewer_beer.description, abv: brewer_beer.abv, ibu: brewer_beer.ibu)
      # end
    end
  end
end