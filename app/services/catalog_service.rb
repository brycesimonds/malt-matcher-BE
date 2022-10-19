class CatalogService
  class << self
    def get_url(url, lat = nil, long = nil, radius = nil)
      conn = Faraday.new(url: 'https://api.catalog.beer') do |faraday|
        faraday.headers['Authorization'] = ENV['catalog_api_key']
        faraday.params[:latitude] = lat
        faraday.params[:longitude] = long
        faraday.params[:search_radius] = radius
      end

      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_breweries(lat, long, radius)
      get_url("/location/nearby", lat, long, radius) 
    end

    def get_beers(brewer_id)
      get_url("/brewer/#{brewer_id}/beer")
    end

    def get_abv_ibu(beer_id)
      get_url("/beer/#{beer_id}")
    end
  end
end