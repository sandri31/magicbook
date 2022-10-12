# frozen_string_literal: true

class PublicController < ApplicationController
  def index; end

  def about; end

  def terms; end

  def random
    url = 'https://api.scryfall.com/cards/random?q=lang:fr'
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @card = JSON.parse(res.body)
  end

  def test
    url = 'https://api.scryfall.com/cards/search?q='
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @card = JSON.parse(res.body)
  end
end
