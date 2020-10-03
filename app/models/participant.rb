# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :match

  has_many :deal_orders, dependent: :destroy
end
