# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def get_denver_breweries_within_1000_miles(lat = 39.738453, long = -104.984853, radius = 1000)
#   json = CatalogService.get_breweries(lat, long, radius)
#   brewery_objects = json[:data].map  do |breweries|
#     Bar.new(breweries) 
#   end
#   brewery_objects.map do |brewery_object|
#     if Brewery.where(address: brewery_object.address).present? == false
#       Brewery.create!(address: brewery_object.address, name: brewery_object.name, catalog_brewery_id: brewery_object.catalog_brewery_id, distance_from_user: brewery_object.distance_from_user, website: brewery_object.website, facebook: brewery_object.facebook, instagram: brewery_object.instagram, twitter: brewery_object.twitter, brewery_description: brewery_object.brewery_description)
#     end
#   end
# end

# self.get_denver_breweries_within_1000_miles

# Brewery.all.each do |brewery|
#   this_breweries_beers = CatalogService.get_beers(brewery.catalog_brewery_id)
#   array_of_beer_objects = this_breweries_beers[:data].map do |beer|
#     single_beer_abv_ibu = CatalogService.get_abv_ibu(beer[:id])
#     Drink.new(beer, single_beer_abv_ibu)
#   end 
#   array_of_beer_objects.map do |beer_object|
#     Beer.create!(catalog_beer_id: beer_object.catalog_beer_id, name: beer_object.name, style: beer_object.style, description: beer_object.description, abv: beer_object.abv, ibu: beer_object.ibu, catalog_brewery_id: beer_object.catalog_brewery_id, last_modified: beer_object.last_modified, brewery_id: brewery.id)
#   end
# end
