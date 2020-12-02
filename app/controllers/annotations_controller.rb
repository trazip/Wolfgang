class AnnotationsController < ApplicationController
  include CableReady::Broadcaster

  def create
    @page = Page.find(params[:page_id])
    if @page.annotation
      @page.annotation.update(data: params[:data])
    else
      Annotation.create(page: @page, data: params[:data], user: current_user)
    end
    skip_authorization
  end

  def drawing
    cable_ready["drawing-stream"].dispatch_event(
      selector: "#viewer",
      name: "drawing",
      detail: { data: params[:data], page_id: params[:page_id], user_id: params[:user_id] }
    )

    cable_ready["drawing-stream"].set_dataset_property(
      selector: "#viewer", # required - string containing a CSS selector or XPath expression
      name:     "annotation", # required - the property to set
      value:    params[:data]  # [null]   - the value to assign to the dataset
    )
    cable_ready.broadcast
    skip_authorization
  end
end
