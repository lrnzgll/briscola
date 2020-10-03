# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :victor, class_name: 'User', foreign_key: 'user_id', optional: true

  has_many :participants, dependent: :destroy
  has_many :deals, dependent: :destroy
end
