module TripsHelper
  def todolist_options(listings, trip)
    if @listings.count > 0
      render :partial => "listings/details", :locals => {:listings => listings, :trip => trip}
    else
      "None"
    end
  end
end
