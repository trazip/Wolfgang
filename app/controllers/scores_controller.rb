require 'open-uri'

class ScoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      sql_query = " \ 
      scores.title ILIKE :query \
      OR composers.name ILIKE :query \ "
    @scores = policy_scope(Score.joins(:composer).where(sql_query, query: "%#{params[:query]}%"))
    authorize @scores
    else
    @scores = policy_scope(Score)
    end
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
