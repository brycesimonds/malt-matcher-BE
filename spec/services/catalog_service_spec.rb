require 'rails_helper'

RSpec.describe 'Catalog API' do 

  let!(:latitude) { '39.738453' }  
  let!(:longitude) { '-104.984853' }  
  let!(:radius) { '50' }  
  let!(:fixture1) { File.read('./spec/fixtures/nearby_breweries_call.json')}

  let!(:brewer_id) { '200e1e9b-e073-42b6-92d4-e4bb26beedff' }
  let!(:fixture2) { File.read('./spec/fixtures/brewer_beers_call.json')}

  let!(:beer_id) { 'aa40e890-7a58-4035-a664-c909504f7a25' }
  let!(:fixture3) { File.read('./spec/fixtures/beer_abv_ibu_call.json')}

  it 'returns breweries nearby based on lat, long, and rad', :vcr do 
    allow(CatalogService).to receive(:get_breweries).and_return(JSON.parse(fixture1, symbolize_names: true))

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

  it 'returns beers according to brewer_id', :vcr do 
    allow(CatalogService).to receive(:get_beers).and_return(JSON.parse(fixture2, symbolize_names: true))

    brewer_beers = CatalogService.get_beers(brewer_id)
    data = brewer_beers[:data].first

    expect(data).to be_a(Hash)
  end

  it 'returns beers abv ibu of a beer according to beer_id', :vcr do 
    allow(CatalogService).to receive(:get_abv_ibu).and_return(JSON.parse(fixture3, symbolize_names: true))

    beer_abv_ibu = CatalogService.get_abv_ibu(beer_id)
    data = beer_abv_ibu
    
    expect(data).to be_a(Hash)
    expect(data[:abv]).to be_a(Integer)
    expect(data[:ibu]).to be_a(Integer)
  end
end
