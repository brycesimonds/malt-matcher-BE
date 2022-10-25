namespace :database_handler do 

  desc 'Delete the brewery database' 
    task delete_all: :environment do 
      Beer.destroy_all
      Brewery.destroy_all
      puts 'I happily erased ALL of bryces code, hehe'
    end
  

  desc 'Reset all tables primary keys'
    task reset_keys: :environment do 
      ActiveRecord::Base.connection.tables.each do |table|
        ActiveRecord::Base.connection.reset_pk_sequence!(table)
      end
      puts 'lets go cris-co, keys reset'
    end

  desc 'Update the brewery database' 
    task :update_breweries => :environment do
      lat = 39.738453
      lon = -104.984853
      radius = 1000
      json = CatalogService.get_breweries(lat, lon, radius)
      brewery_objects = json[:data].map  do |breweries|
        Bar.new(breweries) 
      end
      brewery_objects.map do |brewery_object|
        if Brewery.where(address: brewery_object.address).present? == false
          Brewery.create!(address: brewery_object.address, name: brewery_object.name, catalog_brewery_id: brewery_object.catalog_brewery_id, distance_from_user: brewery_object.distance_from_user, website: brewery_object.website, facebook: brewery_object.facebook, instagram: brewery_object.instagram, twitter: brewery_object.twitter, brewery_description: brewery_object.brewery_description)
        end
      end
      puts 'the breweries for Denver, CO have been updated'
    end

  desc 'Update the beer database'
    task :update_beers => :environment do
      Brewery.all.each do |brewery|
        this_breweries_beers = CatalogService.get_beers(brewery.catalog_brewery_id)
        array_of_beer_objects = this_breweries_beers[:data].map do |beer|
          single_beer_abv_ibu = CatalogService.get_abv_ibu(beer[:id])
          Drink.new(beer, single_beer_abv_ibu)
        end 
        array_of_beer_objects.map do |beer_object|
          Beer.create!(catalog_beer_id: beer_object.catalog_beer_id, name: beer_object.name, style: beer_object.style, description: beer_object.description, abv: beer_object.abv, ibu: beer_object.ibu, catalog_brewery_id: beer_object.catalog_brewery_id, last_modified: beer_object.last_modified, brewery_id: brewery.id)
        end
      end
      puts '99 bottles of beer on the wall, take one down 98 bottles of beer on the wall'
    end
end

