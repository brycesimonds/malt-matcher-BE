class Drink
  attr_reader :catalog_beer_id,
              :catalog_brewery_id,
              :name,
              :style,
              :description,
              :abv,
              :ibu,
              :last_modified

  def initialize(data, data2)
    @catalog_beer_id = data[:id]
    @catalog_brewery_id = data2[:brewer][:id]
    @name = data[:name]
    @style = data[:style]
    @description = data2[:description]
    @abv = data2[:abv]
    @ibu = data2[:ibu]
    @last_modified = format_time(data2[:brewer][:last_modified])
  end

  def format_time(unix_time)
    Time.at(unix_time).strftime("%Y-%m-%d").to_s
  end
end