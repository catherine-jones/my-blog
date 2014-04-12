class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :collect_meetup_events #before filter calls a function with the name that matches the symbol

  def collect_meetup_events
  	@meetup_api = ::MeetupApi.new

  end
end
