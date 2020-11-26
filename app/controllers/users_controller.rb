class UsersController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @user = User.find(params[:id])
    @collections = Collection.where(user_id: @user.id)
  end
end
