# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :printed_name, presence: true, uniqueness: { scope: :user_id }

  def total_price
    price_total = 0
    self.quantity.times do
      price_total += self.price
    end
    price_total
  end
end
