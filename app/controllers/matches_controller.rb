# frozen_string_literal: true

class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    binding.pry
  end

end
