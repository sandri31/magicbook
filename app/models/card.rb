# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :printed_name, presence: true, uniqueness: { scope: :user_id }

  def total_prices
    price_total = 0
    return 0 if price.nil?

    quantity.times do
      price_total += price
    end
    price_total
  end

  # If the quantity is 0, we destroy the card
  def destroy_if_quantity_is_zero
    return unless quantity <= 0

    destroy
  end
end
