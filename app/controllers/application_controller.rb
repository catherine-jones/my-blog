class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :collecteventdata #before filter calls a function with the name that matches the symbol 

  def collecteventdata
  	respose=HTTParty.get('http://api.meetup.com/2/events?&sign=true&rsvp=yes&member_id=80708842&page=20&key=6224623c405f733c663516753c117c30')
  	@eventdata=JSON.parse respose.body
  	

  end
end
