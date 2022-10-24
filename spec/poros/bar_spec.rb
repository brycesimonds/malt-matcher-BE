require 'rails_helper'

RSpec.describe Bar do 

  let!(:fixture) { File.read('./spec/fixtures/nearby_breweries_call.json')}

  it 'exists and has attributes' do 
    parsed_json = JSON.parse(fixture, symbolize_names: true)
    brewery = Bar.new(parsed_json[:data][0])

    expect(brewery).to be_a(Bar)
    expect(brewery.address).to eq("1700 Vine St, Denver, CO 80206")
    expect(brewery.brewery_description).to eq(nil)
    expect(brewery.catalog_brewery_id).to eq("e2e7cd0a-9973-4abe-81ea-7b04f91e634c")
    expect(brewery.distance_from_user).to eq("1.3 miles")
    expect(brewery.facebook).to eq("https://www.facebook.com/mountainsunpub")
    expect(brewery.instagram).to eq("https://www.instagram.com/mountainsunpub/")
    expect(brewery.name).to eq("Vine Street Pub and Brewery - Mountain Sun Brewery")
    expect(brewery.twitter).to eq("https://twitter.com/mountainsunpub")
    expect(brewery.website).to eq("http://www.mountainsunpub.com/")
  end

end