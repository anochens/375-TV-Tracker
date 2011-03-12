# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Thetvdb.pretty_format = false #default option, but good to be explicit
Thetvdb.apikey = "4C55DAD24064440B" 
all_ids = Thetvdb.getAllSeriesIds

all_ids[0..100].each{|id|
	full_record = Thetvdb.getFullSeriesRecord(id)
	series = full_record["Series"][0]
	
	#need to put in logo eventually...	
	channel = Channel.find_or_create_by_name(series["Network"][0])	

	series_overview = series["Overview"][0] || "No overview provided"

	series_obj = SeriesItem.create!(:remote_id => id, :name=> series["SeriesName"][0], :description => series_overview, :channel_id => channel.id);
	
   episodes = Thetvdb.break_array(full_record["Episode"])

	episodes.each{|episode|
		season_no = episode["SeasonNumber"][0] || "-1"

   	season = Season.find_or_create_by_series_item_id_and_season_number(series_obj.id,season_no)
			
	  	e = Episode.find_or_create_by_season_id_and_episode_number(season.id,episode["EpisodeNumber"][0]) 	
		e.name = episode["EpisodeName"][0]
		e.imdb_id = episode["IMDB_ID"][0]
   	e.duration = series["Runtime"][0]
   	e.start_est = series["Airs_Time"][0]
		e.description = episode["Overview"][0] || "No description provided"
		e.air_date = episode["FirstAired"][0]
		e.save!

      #something with guest stars could go here...
	}	

	#create all the actors and roles for this series
	actors = Thetvdb.break_array(series["Actors"])
	
	actors.each{|actor|
   	parts = actor.split(" ")
		first = parts[0]
		rest_a = parts[1..-1] || []   #avoid trying to join nil
	   rest  = rest_a.join(" ")

		actor_obj = Actor.find_or_create_by_first_name_and_last_name(first,rest)

		#since we don't have role info, just create generic role
		Role.find_or_create_by_series_item_id_and_actor_id_and_character_name(series_obj.id, actor_obj.id, "Main character")
	}
}
