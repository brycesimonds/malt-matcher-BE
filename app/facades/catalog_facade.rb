class CatalogFacade
  class << self
    def breweries(lat, long, radius)
      json = CatalogService.get_breweries(lat, long, radius)
      brewery_objects = json[:data].map  do |breweries|
        Bar.new(breweries) 
      end
      brewery_objects.flat_map do |brewery|
        found_brewery = Brewery.where(address: brewery.address)
        found_brewery.update(distance_from_user: brewery.distance_from_user)
      end
    end

    def brewer_beers(brewery_objects, user_style)
      breweries_that_have_style_of_beer = []
      brewery_objects.flatten.each do |single_brewery|
        if user_style == "IPA"
          if single_brewery.beers.find_all {|beer| beer.style.downcase == "india pale ale"}.present?
            breweries_that_have_style_of_beer << single_brewery
          elsif single_brewery.beers.find_all {|beer| beer.style.downcase.include?("#{user_style.downcase}")}.present?
            breweries_that_have_style_of_beer << single_brewery
          end
        else
          if single_brewery.beers.find_all {|beer| beer.style.downcase.include?("#{user_style.downcase}")}.present?
            breweries_that_have_style_of_beer << single_brewery
          end
        end
      end 
      return breweries_that_have_style_of_beer
    end 
  end 
end 