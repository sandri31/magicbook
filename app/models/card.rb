# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  delegate :total_price, :to => :cards, :prefix => true
  scope :white, -> { where(color_identity: 'W') }
  scope :blue, -> { where(color_identity: 'U') }
  scope :black, -> { where(color_identity: 'B') }
  scope :red, -> { where(color_identity: 'R') }
  scope :green, -> { where(color_identity: 'G') }
  scope :colorless, -> { where(color_identity: '') }
  scope :multicolor, lambda {
                       where.not(color_identity: 'W').where.not(color_identity: 'U').where.not(color_identity: 'B')
                       .where.not(color_identity: 'R').where.not(color_identity: 'G').where.not(color_identity: '')
                     }

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :printed_name, presence: true, uniqueness: { scope: :user_id }

  def total_price
    self.price * self.quantity
  end

  # If the quantity is 0, we destroy the card
  def destroy_if_quantity_is_zero
    return unless quantity <= 0

    destroy
  end

  def self.find_or_create(card_params, current_user)
    card = Card.find_by(name: card_params[:name], user_id: current_user.id)
    card = Card.create(card_params.merge(user_id: current_user.id)) unless card
    card
  end
end
