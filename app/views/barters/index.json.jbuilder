json.array!(@barters) do |barter|
  json.extract! barter, :id, :product, :description, :category, :neighborhood, :expiration
  json.url barter_url(barter, format: :json)
end
