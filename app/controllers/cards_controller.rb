# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]
  before_action :search_params, only: %i[new]
  before_action :require_user_permission, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[index top]

  # GET /cards or /cards.json
  def index
    @user = current_user
    @cards = Card.where(user_id: @user.id)

    # Sort the cards by color
    @sorted_cards = Card.sorted_by_color(@user.id)

    @total_price = @cards.sum(&:total_price)
  end

  # GET /cards/1 or /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @cards = ScryfallService.search(params[:search])
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards or /cards.json
  def create
    if Card.exists_by_name_and_user?(card_params[:name], current_user.id)
      update_card
    else
      create_card
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    @card.update(card_params)
    @card.destroy_if_quantity_is_zero
    redirect_to cards_path
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    destroy_if_quantity_is_zero
  end

  def top
    @user = current_user
    @cards = Card.where(user_id: @user.id)
  end

  private

  def create_card
    @card = Card.new(card_params)
    @card.user = current_user
    @card_price = ScryfallService.card_price(card_params[:name])

    if @card_price['prices']['eur'].present?
      @card.price = @card_price['prices']['eur']
    elsif @card_price['prices']['eur_foil'].present?
      @card.price = @card_price['prices']['eur_foil']
    end

    @card.quantity += 1
    @card.save
    flash[:notice] = 'Carte ajoutée à votre collection!'
    redirect_to new_card_path
  end

  def update_card
    @card = Card.where(name: card_params[:name], user_id: current_user.id).first
    @card.quantity += 1
    @card.save
    flash[:notice] = 'Carte ajoutée à votre collection!'
    redirect_to new_card_path
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  def require_user_permission
    return if @card.user.can_modify?(current_user)

    flash[:danger] = "Vous n'avez pas les autorisations pour effectuer cette action"
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:printed_name, :name, :user_id, :image_uris, :multiverse_ids, :quantity, :price,
                                 :color_identity)
  end

  # This method allows you to retrieve the search parameters
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
