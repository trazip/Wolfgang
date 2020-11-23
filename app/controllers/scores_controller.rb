class ScoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @scores = policy_scope(Score)
    # @genres = Score.genres.all
    # @composers = Score.composers.all
  end

  def create
    @score = Score.new(score_params)
    @score.user = current_user
    authorize @score
  end

  def show
  end

  def import
  end
end
