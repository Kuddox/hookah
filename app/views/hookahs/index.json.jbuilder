json.array!(@hookahs) do |hookah|
  json.extract! hookah, :id, :title, :description
  json.url hookah_url(hookah, format: :json)
end
