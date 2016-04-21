json.array!(@truck.errors) do |field, message|
  json.error do
    json.field field
    json.message message
  end
end
