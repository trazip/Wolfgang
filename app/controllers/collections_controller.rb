class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR abilities ILIKE :query"
      @collections = Collection.where(sql_query, query: "%#{params[:query]}%")
    else
      @collections = Collection.all
    end
  end

  def show
    @scores = @collection.scores
    @collections = Collection.where(collection_id: @collection.id)
    authorize @collection
  end

  def new
    @collection = Collection.new
    authorize @collection
  end

  def edit
    @collection = Collection.find(params[:id])
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    authorize @collection

    if @collection.save
      redirect_to @collection, notice: 'Your collection was successfully created.'
    else
      render :new
    end
  end

  def update
    @collection = Collection.find(params[:id])
    authorize @collection
    @collection.update(collection_params)
    redirect_to collection_path(@collection)
  end

  def destroy
    @collection.destroy
    redirect_to root_path, notice: 'Collection was successfully destroyed.'
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
    authorize @collection
  end

  def collection_params
    params.require(:collection).permit(:title)
  end
end
