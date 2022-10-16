class Bar
  attr_reader :catalog_brewery_id,
              :name,
              :address,
              :distance_from_user,
              :website,
              :instagram,
              :facebook,
              :twitter,
              :brewery_description

  def initialize(data)
    @catalog_brewery_id = data[:location][:id]
    @name = data[:brewer][:name]
    @address = format_address(data)
    @distance_from_user = format_distance(data)
    @website = data[:brewer][:url]
    @instagram = data[:brewer][:instagram_url]
    @facebook = data[:brewer][:facebook_url]
    @twitter = data[:brewer][:twitter_url]
    @brewery_description = data[:brewer][:description]
  end

  def format_address(data)
    data[:location][:address][:address2] + ", " +  data[:location][:address][:city] + ", " + data[:location][:address][:state_short] + " " + data[:location][:address][:zip5].to_s
  end
  
  def format_distance(data)
    data[:distance][:distance].to_s + " " + data[:distance][:units]
  end
end