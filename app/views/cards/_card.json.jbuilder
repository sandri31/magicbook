json.extract! card, :id, :title, :description, :author, :year, :image_uri, :categorie, :color, :note, :price, :add_date, :lang, :foil, :created_at, :updated_at
json.url card_url(card, format: :json)
