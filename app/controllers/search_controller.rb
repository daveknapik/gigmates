class SearchController < ApplicationController
  respond_to :html, :json

  def show
  	return nil unless params[:type] && params[:term]
  	
  	case params[:type]
  	when "location"
  		events = Songkick.get_metro_area_events(params[:term], page: 12)
    when "artist"
      events = Songkick.get_artist_events(params[:term])
    end
    
    respond_with(events) do |format|
      format.json { 
        render json: {
          current_page: events.page,
          per_page: 50,
          total_pages: events.total_entries,
          entries: events.results
        }
      }
    end
  end
end
