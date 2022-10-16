class CatalogService
  class << self
    def get_url(url, lat, long, radius)
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
  end
end