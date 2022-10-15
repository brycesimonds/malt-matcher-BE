require 'rails_helper'

RSpec.describe 'Catalog API' do 

  let!(:latitude) { '39.738453' }  
  let!(:longitude) { '-104.984853' }  
  let!(:radius) { '50' }  
  let!(:fixture) { File.read('./spec/fixtures/nearby_breweries_call.json')}

  it 'returns breweries nearby based on lat, long, and rad', :vcr do 
    allow(CatalogService).to receive(:get_breweries).and_return(JSON.parse(fixture, symbolize_names: true))

    nearby_breweries = CatalogService.get_breweries(latitude, longitude, radius)
    data = nearby_breweries[:data][0]

    expect(data).to be_a(Hash)
    expect(data).to have_key(:location)
    expect(data[:location][:id]).to be_a(String)
    expect(data[:location][:object]).to be_a(String)
    expect(data[:location][:name]).to be_a(String)
    expect(data[:location][:brewer_id]).to be_a(String)
    expect(data[:location][:latitude]).to eq(39.7434731)
    expect(data[:location][:longitude]).to eq(-104.9619904)
  end
end
