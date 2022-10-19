require 'rails_helper'

RSpec.describe CatalogFacade, :vcr do 
  it 'can return nearby breweries from a poro with facade call', :vcr do 
    nearby_breweries = CatalogFacade.breweries('39.738453', '-104.984853', '50')
    expect(nearby_breweries.first).to be_an_instance_of(Brewery)
  end

  it 'can return brewer beers from a poro with facade call', :vcr do
    nearby_breweries = CatalogFacade.breweries('39.738453', '-104.984853', '50') 
    brewer_beers = CatalogFacade.brewer_beers(nearby_breweries, "IPA")
    expect(nearby_breweries.first).to be_an_instance_of(Brewery)
    # expect(brewer_beers.first).to be_an_instance_of(Drink)
  end
end