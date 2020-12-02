class DrawingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "drawing-stream"
  end
end
