require 'rails_helper'

RSpec.describe CatalogFacade, :vcr do 
  it 'can return nearby breweries from a poro with facade call', :vcr do 
    nearby_breweries = CatalogFacade.breweries('39.738453', '-104.984853', '50')
    expect(nearby_breweries.first).to be_an_instance_of(Bar)
  end
end