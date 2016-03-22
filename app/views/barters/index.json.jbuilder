json.array!(@barters) do |barter|
  json.extract! barter, :id, :product, :description, :category, :location, :expiration
  json.url barter_url(barter, format: :json)
end
