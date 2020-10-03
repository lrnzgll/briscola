# frozen_string_literal: true

class Suit < ApplicationRecord
  validates :suit_name, presence: true

  has_many :cards, dependent: :destroy
end
