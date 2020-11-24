class ScoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR composer ILIKE :query"
      @scores = Score.where(sql_query, query: "%#{params[:query]}%")
    else
      @scores = policy_scope(Score)
    end
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
