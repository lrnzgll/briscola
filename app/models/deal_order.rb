# frozen_string_literal: true

class DealOrder < ApplicationRecord
  belongs_to :participant
  belongs_to :deal
end
