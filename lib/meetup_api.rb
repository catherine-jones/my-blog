require 'ostruct'

class MeetupApi
  def response
    HTTParty.get('http://api.meetup.com/2/events?&sign=true&rsvp=yes&member_id=80708842&page=20&key=6224623c405f733c663516753c117c30')
  end

  def data
    @data ||= JSON.parse(response.body)
  end

  def results
    @results ||= data['results']
  end

  def visible_events
    @visible_events ||= results.select{ |e| e['visibility'] == 'public' }
  end

  def events
    visible_events.collect do |e|
      OpenStruct.new(
        name: e['name'],
        start: Time.at(e['time'] / 1_000),
        url: e['event_url'],
        address: e['venue']['address_1'],
        map_url: "http://maps.google.com?q=#{URI.encode(e['venue']['address_1'])}"
      )
    end
  end
end

# Here's a reminder of what the returned data looks like

# => {"results"=>
#   [{"visibility"=>"public",
#     "status"=>"upcoming",
#     "maybe_rsvp_count"=>0,
#     "venue"=>
#      {"id"=>10374582,
#       "lon"=>151.220108,
#       "repinned"=>false,
#       "name"=>"King Street Brewhouse",
#       "address_1"=>"King Street Wharf/22 The Promenade",
#       "lat"=>-33.869225,
#       "country"=>"au",
#       "city"=>"Sydney"},
#     "id"=>"173258922",
#     "utc_offset"=>36000000,
#     "time"=>1397552400000,
#     "waitlist_count"=>0,
#     "created"=>1395730452000,
#     "yes_rsvp_count"=>27,
#     "updated"=>1395730471000,
#     "event_url"=>
#      "http://www.meetup.com/Ruby-On-Rails-Oceania-Sydney/events/173258922/",
#     "description"=>
#      "<p><b>What is it?</b></p> <p>This is a monthly Meetup to learn and see some amazing thin
#     "headcount"=>0,
#     "name"=>"SydInMotion",
#     "group"=>
#      {"id"=>7610932,
#       "group_lat"=>-33.869998931884766,
#       "name"=>"Ruby on Rails Oceania Sydney",
#       "group_lon"=>151.2100067138672,
#       "join_mode"=>"open",
#       "urlname"=>"Ruby-On-Rails-Oceania-Sydney",
#       "who"=>"Rubyists"}},
#    {"rsvp_limit"=>37,
#     "status"=>"upcoming",
#     "visibility"=>"public",
#     "maybe_rsvp_count"=>0,
#     "venue"=>
#      {"id"=>19254002,
#       "lon"=>151.203964,
#       "repinned"=>false,
#       "name"=>"Adobe Offices, Tower 2 (PWC Building) ",
#       "address_1"=>"Level 27, 201 Sussex Street Sydney",
#       "lat"=>-33.871445,
#       "country"=>"au",
#       "city"=>"Sydney"},
#     "id"=>"174367372",
#     "utc_offset"=>36000000,
#     "time"=>1398758400000,
#     "waitlist_count"=>15,
#     "updated"=>1397029111000,
#     "yes_rsvp_count"=>37,
#     "created"=>1396217753000,
#     "event_url"=>
#      "http://www.meetup.com/Women-Who-Code-Sydney/events/174367372/",
#     "description"=>
#      "<p>This event will mostly be a self paced hack night. </p> <p>Primarily we will focus on
#     "name"=>"Javascript Hack Night (PhoneGap + Ionic)",
#     "headcount"=>0,
#     "group"=>
#      {"id"=>12319092,
#       "group_lat"=>-33.869998931884766,
#       "name"=>"Women Who Code Sydney",
#       "group_lon"=>151.2100067138672,
#       "join_mode"=>"open",
#       "urlname"=>"Women-Who-Code-Sydney",
#       "who"=>"Coders"}},
#    {"rsvp_limit"=>40,
#     "status"=>"upcoming",
#     "visibility"=>"public",
#     "maybe_rsvp_count"=>0,
#     "venue"=>
#      {"id"=>11130502,
#       "lon"=>151.198792,
#       "repinned"=>false,
#       "name"=>"EngineRoom Chippendale",
#       "address_1"=>"Level 3, 79 Myrtle St (near the corner of Abercrombie)",
#       "lat"=>-33.887325,
#       "country"=>"au",
#       "city"=>"Sydney"},
#     "id"=>"164952062",
#     "utc_offset"=>36000000,
#     "duration"=>21600000,
#     "time"=>1399773600000,
#     "waitlist_count"=>0,
#     "updated"=>1391733334000,
#     "yes_rsvp_count"=>22,
#     "created"=>1391733334000,
#     "event_url"=>"http://www.meetup.com/OzBerryPi/events/164952062/",
#     "description"=>
#      "<p>Our monthly hackspace encompasses <b>a wide range of</b> <b>O</b><b>pen</b> <b>Source
#     "how_to_find_us"=>
#      "Press the buzzer to the left of the door. Come up to level 3.",
#     "name"=>"Open Source Hardware HackSpace @ EngineRoom",
#     "headcount"=>0,
#     "group"=>
#      {"id"=>4358912,
#       "group_lat"=>-33.869998931884766,
#       "name"=>"OzBerryPi - Sydney's Open Source Hardware Maker Space",
#       "group_lon"=>151.2100067138672,
#       "join_mode"=>"open",
#       "urlname"=>"OzBerryPi",
#       "who"=>"Makers"}}],
