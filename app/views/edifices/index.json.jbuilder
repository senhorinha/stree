json.array!(@edifices) do |edifice|
  json.extract! edifice, :id, :name, :sustainability_level, :last_update_of_sustainability_level
  json.url edifice_url(edifice, format: :json)
end
