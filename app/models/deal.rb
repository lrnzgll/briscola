# frozen_string_literal: true

class Deal < ApplicationRecord
  belongs_to :match

  has_many :deal_orders, dependent: :destroy
end
