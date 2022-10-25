require 'rails_helper'

RSpec.describe Drink do 
    
 let!(:fixture) { File.read('./spec/fixtures/brewer_beers_call.json')}
 let!(:fixture_2) { File.read('./spec/fixtures/beer_abv_ibu_call.json')}
    it 'exists and has attributes' do 
        parsed_json = JSON.parse(fixture, symbolize_names: true)
        parsed_json_2 = JSON.parse(fixture_2, symbolize_names: true)
        
        beer = Drink.new(parsed_json[:data][0], parsed_json_2)
        
        expect(beer).to be_a(Drink)
    
        expect(beer.abv).to eq(5)
        expect(beer.abv).to_not eq(6)
        expect(beer.catalog_beer_id).to eq("aa40e890-7a58-4035-a664-c909504f7a25")
        expect(beer.catalog_beer_id).to_not eq("82c9f01a-47c8-4c1b-8f13-1d34a01a86a7")
        expect(beer.ibu).to eq(37)
        expect(beer.ibu).to_not eq(100)
        expect(beer.name).to eq("Altbier")
         expect(beer.style).to_not eq("Kölsch")
        expect(beer.style).to eq("German-Style Altbier")
        expect(beer.style).to_not eq("German-Style Kölsch / Köln-Style Kölsch")
    end 
end 