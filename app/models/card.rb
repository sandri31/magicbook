# frozen_string_literal: true

class Card < ApplicationRecord
  has_many :profile_cards, dependent: :destroy
  has_many :users, through: :profile_cards
end
