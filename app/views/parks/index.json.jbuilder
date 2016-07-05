json.array!(@parks) do |park|
  json.extract! park, :id, :name, :floor, :number, :phone
  json.url park_url(park, format: :json)
end
