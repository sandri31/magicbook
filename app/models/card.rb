# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
end
