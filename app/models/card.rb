# frozen_string_literal: true

class Card < ApplicationRecord
  validates :card_name, presence: true

  belongs_to :suit
  belongs_to :rank
end
