json.array!(@sustainability_level_checks) do |sustainability_level_check|
  json.extract! sustainability_level_check, :id, :sustainability_level, :edifice_id
  json.url sustainability_level_check_url(sustainability_level_check, format: :json)
end
