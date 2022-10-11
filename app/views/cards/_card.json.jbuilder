json.extract! card, :id, :scryfall_id, :quantity, :created_at, :updated_at
json.url card_url(card, format: :json)
