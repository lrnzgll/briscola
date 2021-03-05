# frozen_string_literal: true

class Match < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :deals, dependent: :destroy
end
