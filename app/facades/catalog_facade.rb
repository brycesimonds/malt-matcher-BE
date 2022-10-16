class CatalogFacade
  class << self
    def breweries(lat, long, radius)
      json = CatalogService.get_breweries(lat, long, radius)
      json[:data].map  do |breweries|
        Bar.new(breweries) 
      end
    end
  end
end