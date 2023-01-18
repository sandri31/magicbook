class ScryfallService < ApplicationRecord
  include HTTParty

  base_uri 'https://api.scryfall.com'

  def self.search(query)
    get("/cards/search?q=lang:fr+#{query}")
  end

  def self.card_price(name)
    get("/cards/named?exact=#{name}")
  end
end
