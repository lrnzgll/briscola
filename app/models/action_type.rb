# frozen_string_literal: true

class ActionType < ApplicationRecord
  validates :name, presence: true

  has_many :actions, dependent: :nullify
end
