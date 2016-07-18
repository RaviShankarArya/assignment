class EventsController < ApplicationController


  def index
    @event = Event.first

    respond_to do |format|
      format.html
      format.css
    end
  end

  def edit
    @event = Event.find_by_id params[:id]
  end

  def update
    @event = Event.find_by_id params[:id]
    @event.update_attributes(event_params)
    redirect_to :events

  end

  private

  def event_params
    params.require(:event).permit(:title,:description,:background_color_id,:font)
  end

end