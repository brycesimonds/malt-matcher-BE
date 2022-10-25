every 1.day, at: '4:30 am' do 
  rake "database_handler:delete_all"
  rake "database_handler:update_breweries"
  rake "database_handler:update_beers"
end
