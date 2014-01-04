json.array!(@albums) do |album|
  json.extract! album, :id, :name, :artist, :year, :genre
  json.url album_url(album, format: :json)
end
