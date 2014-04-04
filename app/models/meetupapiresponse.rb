def initializer(eventdata)
  @eventdata = eventdata

	def events  #for an event get the following values
		@eventdata.results[0]['name']
		@eventdata.results[0]['time'] #need to do something to make the time display in a readable format
		@eventdata.results[0]['venue']['name']
		@eventdata.results[0]['venue']['address_1']
		@eventdata.results[0]['venue']['address_2']
		@eventdata.results[0]['venue']['city']
		@eventdata.results[0]['venue']['event_url']
	end

	def events
  		@eventdata.results[0].map{|e| MeetupEvent.new e } #what does map do e is a variable 
	end

end


 
