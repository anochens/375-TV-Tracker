# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Thetvdb.apikey = "4C55DAD24064440B" 
all_ids = Thetvdb.getAllSeriesIds

all_ids[0..100].each{|id|
  	info = Thetvdb.infoForSeriesId(id)
	
	#need to put in logo eventually...	
	channel = Channel.find_or_create_by_name(info["Network"])	

	s = SeriesItem.create!(:remote_id => id, :name=> info["SeriesName"], :description => info["Overview"], :channel_id => channel.id);
	
	actors = info["Actors"].split("|")
	actors.each{|actor|
		next if actor.nil?
   	parts = actor.split(" ")
		first = parts[0]
		rest_a = parts[1..-1] || []   #avoid trying to join nil
	   rest  = rest_a.join(" ")

		a = Actor.find_or_create_by_first_name_and_last_name(first,rest)

		#since we don't have role info, just create generic role
		Role.find_or_create_by_series_item_id_and_actor_id_and_character_name(s.id, a.id, "role")
	}
}
