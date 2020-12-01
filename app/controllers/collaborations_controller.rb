class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new(collaboration_params)
    authorize @collaboration
    @collaboration.save
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:user_id, :score_id)
  end
end
