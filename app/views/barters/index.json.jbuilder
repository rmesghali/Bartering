json.array!(@barters) do |barter|
  json.extract! barter, :id, :product, :description, :category, :city, :state, :zipcode, :expiration
  json.url barter_url(barter, format: :json)
end
