class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :create_match, only: :dashboard

  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
  end

  private

  def create_match
    @match = Match.create
    @participant = @match.participants.create(
      initial_player_order: 1,
      user: current_user
    )
  end
end
