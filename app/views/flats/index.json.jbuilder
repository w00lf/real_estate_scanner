json.array!(@flats) do |flat|
  json.extract! flat, :id
  json.url flat_url(flat, format: :json)
end
