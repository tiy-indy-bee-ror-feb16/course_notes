json.array!(@trucks) do |truck|
  json.extract! truck, :name, :description, :food_style
  json.url truck_url(truck, format: :json)
end
