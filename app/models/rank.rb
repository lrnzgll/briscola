# frozen_string_literal: true

class Rank < ApplicationRecord
  validates :rank_name, presence: true

  has_many :cards, dependent: :destroy
end
