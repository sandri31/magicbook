# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :printed_name, presence: true, uniqueness: { scope: :user_id }
end
