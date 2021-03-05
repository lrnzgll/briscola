# frozen_string_literal: true

module Cards
  # Creates 40 Cards [Ace-King, Hearts Clubs Diamonds Spades], also creates Suits and Ranks
  class CreatorService

    SUITS = %w[Hearts Clubs Diamonds Spades].map do |suit|
      {
        suit: suit,
        image: "app/assets/images/svgs/#{suit.downcase}.svg"
      }
    end

    RANKS = %w[Ace 2 3 4 5 6 7 Jack Queen King].freeze

    def initialize; end

    def self.call
      new.call
    end

    def call
      ActiveRecord::Base.transaction do
        create_suits!
        create_ranks!
        create_cards!
      end
    rescue StandardError => e
      Rails.logger.error("Error in [Cards::CreatorService#call] : #{e.inspect}")
    end

    def create_suits!
      return if Suit.any?

      SUITS.each do |suit|
        Suit.new(suit_name: suit[:suit],
                 image: suit[:image]).save!
      end
    end

    def create_ranks!
      return if Rank.any?

      RANKS.each do |rank|
        Rank.new(rank_name: rank).save!
      end
    end

    def create_cards!
      return if Card.any?

      Rank.all.map do |r|
        Suit.all.map do |s|
          s.cards.new(rank: r, card_name: "#{r.rank_name} of #{s.suit_name}").save!
        end
      end
    end
  end
end
