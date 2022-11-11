# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]
  before_action :search_params, only: %i[new]
  before_action :authenticate_user!, only: %i[index]

  # GET /cards or /cards.json
  def index
    # @cards = Card.all
    @cards = Card.where(user_id: current_user.id)
  end

  # GET /cards/1 or /cards/1.json
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    @cards = HTTParty.get("https://api.scryfall.com/cards/search?q=lang:fr+#{params[:search]}")
    @card = Card.new
    console
  end
  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)
    @card.save
    redirect_to cards_path

  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    redirect_to cards_path
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  def search
    @cards = Card.where(user_id: current_user.id)
    @cards = Card.where("name LIKE ?", "%#{params[:search]}%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card

  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:name, :user_id, :image_url, :multiverse_ids, :quantity, :price)
  end

  def search_params
    params[:search] = if params[:search].present? && params[:search].length >= 3
      [params[:search]].flatten.join.unicode_normalize(:nfkd).chars.reject do |c|
        c =~ /[\u02B0-\u02FF\u0300-\u036F]/
      end.join.capitalize
    elsif params[:search].present? && params[:search].length < 3
      flash[:alert] = 'Veuillez renseigner au moins 3 caractères pour la recherche'
      redirect_to new_card_path
    else
      params[:search] = %w[Chandra Nissa Jace Gideon Liliana Ajani Sorin Nicol Tezzeret
                           Ugin Ashiok Kaya Samut Defaite Sarkhan].sample
    end
  end
end
