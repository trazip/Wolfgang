class ScoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # if params[:query].present?
    #   sql_query = "title ILIKE :query OR composer ILIKE :query"
    #   @scores = Score.where(sql_query, query: "%#{params[:query]}%")
    # else
    @scores = policy_scope(Score)
    # end
    # @genres = Score.genres.all
    # @composers = Score.composers.all
  end

  def new
    @collection = Collection.create(title: 'My first collection', user: current_user) if current_user.collections.empty?
    @score = Score.new
    authorize @score
  end

  def create
    @score = Score.new(score_params)
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

  private

  def score_params
    params.require(:score).permit(:title, :composer, :genre, :score_creation_date, :collection_id, :file)
  end
end
