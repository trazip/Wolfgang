class AnnotationsController < ApplicationController

  def create
    @page = Page.find(params[:page_id])
    if @page.annotation
      @page.annotation.update(data: params[:data])
    else
      Annotation.create(page: @page, data: params[:data], user: current_user)
    end
    skip_authorization
  end
end
