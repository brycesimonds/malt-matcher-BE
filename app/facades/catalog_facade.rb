class CatalogFacade
  class << self
    def breweries(lat, long, radius)
      json = CatalogService.get_breweries(lat, long, radius)
      brewery_objects = json[:data].map  do |breweries|
        Bar.new(breweries) 
      end
      brewery_objects.flat_map do |brewery|
        Brewery.where(address: brewery.address)
      end
    end

    def brewer_beers(brewery_objects, style)
      breweries_that_have_style_of_beer = []
      brewery_objects.flatten.each do |single_brewery|
        if style == "IPA"
          if single_brewery.beers.where("style ILIKE ?", "%#{style}%").present? || single_brewery.beers.where(style.downcase == "india pale ale").present?
            breweries_that_have_style_of_beer << single_brewery
          end
        elsif single_brewery.beers.where("style ILIKE ?", "%#{style}%").present?
          breweries_that_have_style_of_beer << single_brewery
        end
      end 
      return breweries_that_have_style_of_beer
    end 
  end 
end 