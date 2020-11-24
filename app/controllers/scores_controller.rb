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

    if @score.save
      redirect_to @score, notice: 'Your score was successfully uploaded.'
    else
      render :new
    end
  end

  def show
    @scores = Score.where(score_id: @score.id)
  end

  def import
    @score = Score.new
    authorize @score
  end
end
