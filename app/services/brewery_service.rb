class BreweryService 
  class << self
    def get_url(url, location)
      conn = Faraday.new(url: 'https://api.catalog.beer/location/nearby') do |faraday|
        faraday.params[:key] = ENV['catalog_api_key']
        faraday.params[:location] = location
      end

      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_breweries(location)
      get_url("/geocoding/v1/address", location) 
    end
  end
end 