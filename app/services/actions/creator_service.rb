# frozen_string_literal: true

module Actions
  # Creates all action types used in the game
  class CreatorService
    include Callable

    def call
      ActiveRecord::Base.transaction do
        draw_card!
        play_card!
        briscola!
        collect_card!
      end
    rescue StandardError => e
      Rails.logger.error("Error in [Cards::CreatorService#call] : #{e.inspect}")
    end

    private

    def draw_card!
      ActionType.find_or_create_by!(name: 'draw_card')
    end

    def play_card!
      ActionType.find_or_create_by!(name: 'play_card')
    end

    def briscola!
      ActionType.find_or_create_by!(name: 'briscola')
    end

    def collect_card!
      ActionType.find_or_create_by!(name: 'collect')
    end
  end
end
