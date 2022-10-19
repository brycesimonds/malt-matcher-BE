class Drink
  attr_reader :catalog_beer_id,
              :catalog_brewery_id,
              :name,
              :style,
              :description,
              :abv,
              :ibu

  def initialize(data, data2)
    @catalog_beer_id = data
    @catalog_brewery_id = data
    @name = data
    @style = data
    @description = data
    @abv = data2
    @ibu = data2
  end

end