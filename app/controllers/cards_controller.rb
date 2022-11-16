# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]
  before_action :search_params, only: %i[new]
  before_action :require_same_user , only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[index top]

  # GET /cards or /cards.json
  def index
    @user = current_user
    @cards = Card.where(user_id: @user.id)

    @white_card =      Card.where(color_identity: "W", user_id: @user.id)
    @blue_card =       Card.where(color_identity: "U", user_id: @user.id)
    @black_card =      Card.where(color_identity: "B", user_id: @user.id)
    @red_card =        Card.where(color_identity: "R", user_id: @user.id)
    @green_card =      Card.where(color_identity: "G", user_id: @user.id)
    @colorless_card =  Card.where(color_identity: "" , user_id: @user.id)
    @multicolor_card = Card.where(printed_name: @cards.where.not(color_identity: "W")
                            .where.not(color_identity: "U").where.not(color_identity: "B")
                            .where.not(color_identity: "R").where.not(color_identity: "G")
                            .where.not(color_identity: "").pluck(:printed_name), user_id: @user.id)
  end

  # GET /cards/1 or /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @cards = HTTParty.get("https://api.scryfall.com/cards/search?q=lang:fr+#{params[:search]}")
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)
    @card.user = current_user
    @card_price = HTTParty.get("https://api.scryfall.com/cards/named?exact=#{card_params[:name]}")

    if @card_price["prices"]["eur_foil"] == nil
      @card.price = @card_price["prices"]["eur"]
    else
      @card.price = @card_price["prices"]["eur_foil"]
    end

    if @card.save
      flash[:notice] = "Votre collection a été mise à jour"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    @card.update(card_params)
    redirect_to cards_path
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy
  end

  def top
    @user = current_user
    @cards = Card.where(user_id: @user.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:printed_name, :name, :user_id, :image_uris, :multiverse_ids, :quantity, :price, :color_identity)
  end

  def require_same_user
    if current_user != @card.user
      flash[:danger] = "Vous ne pouvez modifier que vos propres cartes"
      redirect_to root_path
    end
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
