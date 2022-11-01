# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :profile_cards, dependent: :destroy
  has_many :cards, through: :profile_cards
end
