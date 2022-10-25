require 'rails_helper'

RSpec.describe CatalogFacade do 
  let!(:brewery) {Brewery.create!(address: "1700 Vine St, Denver, CO 80206", name: Faker::Name.name , catalog_brewery_id: Faker::ChuckNorris.fact, distance_from_user: Faker::Number.decimal(l_digits: 2) , website: Faker::Internet.domain_name(subdomain: true, domain: "example"), facebook: Faker::Internet.domain_name(subdomain: true, domain: "example"), instagram: Faker::Internet.domain_name(subdomain: true, domain: "example"), twitter: Faker::Internet.domain_name(subdomain: true, domain: "example"), brewery_description: Faker::Internet.domain_name(subdomain: true, domain: "example"))}

  it 'can return nearby breweries from a poro with facade call', :vcr do 
    nearby_breweries = CatalogFacade.breweries('39.738453', '-104.984853', '50')
    expect(nearby_breweries.first).to be_an_instance_of(Brewery)
    expect(nearby_breweries.first).to_not be_an_instance_of(Beer)
  end

  it 'can return brewer beers from a poro with facade call', :vcr do
    nearby_breweries = CatalogFacade.breweries('39.738453', '-104.984853', '50') 
    brewer_beers = CatalogFacade.brewer_beers(nearby_breweries, "IPA")
    expect(nearby_breweries.first).to be_an_instance_of(Brewery)
    expect(nearby_breweries.first).to_not be_an_instance_of(Beer)
  end
end