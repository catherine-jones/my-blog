RubyMeetup::ApiKeyClient.key = ENV['MEETUP_APIKEY']
client = RubyMeetup::ApiKeyClient.new
json_s = client.get_path("/2/events", {:member_id => 390230} {:rsvp => "yes"})
#request url
#https://api.meetup.com/2/events?&sign=true&rsvp=yes&member_id=80708842&page=20
#
#signedurl
#http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&rsvp=yes&desc=false&member_id=80708842&offset=0&format=json&page=20&fields=&sig_id=80708842&sig=793aae30816c3c46268941a405abd104d40d8317
#venue.name
#venue.address_1
#venue.address_2
#group.name
#time
#name

function loadMeetups()
{
	# Display a loading icon in our display element
	$('#feed').html('<span><img src="images/loading.gif" /></span>');

	# Request the JSON and process it
	$.ajax({
		type:'GET',
		url:"https://api.meetup.com/2/events?&sign=true&rsvp=yes&member_id=80708842&page=20",
		#data:"id="+flickrid+"&lang=en-us&format=json&jsoncallback=?",
		success:function(feed) {
			# Create an empty array to store images
			var events = [];

			# Loop through the items
			for (var i=0, l=feed.items.length; i < l && i < 10; ++i)  
			{
				#Manipulate the image to get thumb and medium sizes
				var img = feed.items[i].media.m.replace(
					/^(.*?)_m\.jpg$/, 
					'<a href="$1.jpg"><img src="$1_s.jpg" alt="" /></a>'
				);

				# Add the new element to the array
				events.push(img);
			}

			# Display the thumbnails on the page
			$('#feed').html(events.join(''));

			
		},
		dataType:'jsonp'
	});
}