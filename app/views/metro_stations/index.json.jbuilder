json.array!(@metro_stations) do |metro_station|
  json.extract! metro_station, :id
  json.url metro_station_url(metro_station, format: :json)
end
