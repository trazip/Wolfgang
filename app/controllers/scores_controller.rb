require 'open-uri'

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
      import(@score)
      redirect_to @score, notice: 'Your score was successfully uploaded.'
    else
      render :new
    end
  end

  def show
    @score = Score.find(params[:id])
    authorize @score
  end

  def viewer
    @score = Score.find(params[:id])
    @page = params[:page_id] ? Page.find(params[:page_id]) : @score.pages.first
    skip_authorization
  end

  private

  def import(score)
    file = open(params[:score][:file])
    reader = PDF::Reader.new(file)

    reader.page_count.times do |i|
      url = Cloudinary::Utils.cloudinary_url(score.file.key, page: i + 1)
      page = Page.new(score: score)
      page.file.attach(io: open("#{url}.jpg"), filename: 'file')
      page.save
    end
  end

  def score_params
    params.require(:score).permit(:title, :composer_id, :genre, :score_creation_date, :collection_id, :file)
  end
end
