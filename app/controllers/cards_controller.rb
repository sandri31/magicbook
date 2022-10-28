# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to card_url(@card), notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to card_url(@card), notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    params[:search] = if params[:search].present? && params[:search].length >= 3
                        [params[:search]].flatten.join.unicode_normalize(:nfkd).chars.reject do |c|
                          c =~ /[\u02B0-\u02FF\u0300-\u036F]/
                        end.join.capitalize
                      elsif params[:search].present? && params[:search].length < 3
                        flash[:alert] = 'Veuillez renseigner au moins 3 caractères pour la recherche'
                        redirect_to search_cards_path
                      else
                        params[:search] = %w[Chandra Nissa Jace Gideon Liliana Ajani Sorin Nicol Tezzeret
                                             Ugin Ashiok Kaya Samut Defaite Sarkhan].sample
                      end

    @parameter = params[:search]
    @cards = HTTParty.get("https://api.scryfall.com/cards/search?q=lang:fr+#{@parameter}")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:title, :description, :author, :year, :image_uri, :categorie, :color, :note, :price,
                                 :add_date, :lang, :foil)
  end
end
