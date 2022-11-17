# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :printed_name, presence: true, uniqueness: { scope: :user_id }

  def add_quantity
    if @card_price["prices"]["eur"].present?
      @card.price = @card_price["prices"]["eur"]
    elsif @card_price["prices"]["eur_foil"].present?
      @card.price = @card_price["prices"]["eur_foil"]
    end
  end

  def total_prices
    price_total = 0
    self.quantity.times do
      price_total += self.price
    end
    price_total
  end
  # si la quantité est à 0 ou négative, on supprime la carte
  def destroy_if_quantity_is_zero
    if self.quantity <= 0
      self.destroy
    end
  end

end
