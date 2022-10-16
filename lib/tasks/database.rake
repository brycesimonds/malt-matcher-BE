namespace :database_handler do 

  desc 'Delete the brewery database' 
    task delete_all: :environment do 
      Brewery.destroy_all
      Beer.destroy_all
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
    task :update_breweries, [:lat, :lon, :radius] => :environment do |t, args|
      lat = args[:lat]
      lon = args[:lon]
      radius = args[:radius]
      CatalogFacade.breweries(lat, lon, radius)
      puts 'the breweries for that city have been updated'
    end

  # desc 'Update the beer database'
  #   task :update_beers, [:brewery_id] => :environment do |t, args|
  #     brewery_id = args[:brewery_id]
  #     CatalogFacade.beers(brewery_id)
  #     puts '99 bottles of beer on the wall, take one down 98 bottles of beer on the wall'
  #   end
end

