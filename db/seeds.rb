# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Thetvdb.pretty_format = false #default option, but good to be explicit
Thetvdb.apikey = "4C55DAD24064440B" 

#each series has an ID, which is stored in a text file with the gem, for now
all_ids = Thetvdb.getAllSeriesIds

p 'This will take a while, please be patient...'

# only put in 25 shows for now
all_ids[1500..2000].each{|id|
	full_record = Thetvdb.getFullSeriesRecord(id)
	series = full_record["Series"][0]
	
	#need to put in logo eventually...
	channel = Channel.find_or_create_by_name(series["Network"][0])

	series_overview = series["Overview"][0]
	series_overview = "No overview provided" if series_overview.nil? || series_overview == "" || series_overview == {}

	next if series["SeriesItem"].nil? || series["SeriesItem"] == ""
	
	series_obj = SeriesItem.create!(:remote_id => id, :name=> series["SeriesName"][0], :description => series_overview, :channel_id => channel.id);
	
	episodes = Thetvdb.break_array(full_record["Episode"])

	episodes.each{|episode|
		next if episode.nil? || episode == "" || episode == [] || episode == {}
		season_no = episode["SeasonNumber"]
		season_no = Thetvdb.extractElemFromArray season_no[0]
		season_no ||= "-1"  # if -1, there's a problem, but silence is fine

		season = Season.find_or_create_by_series_item_id_and_season_number(series_obj.id,season_no)
		season.start_date = nil
		season.end_date = nil
		season.save!

		e = Episode.find_or_create_by_season_id_and_episode_number(season.id,episode["EpisodeNumber"][0]) 	
		e.name        = episode["EpisodeName"][0]
		e.imdb_id     = episode["IMDB_ID"][0]
		e.duration    = series["Runtime"][0]
		e.start_est   = series["Airs_Time"][0]
		e.description = episode["Overview"][0]  
      e.description = "No description provided" if e.description.nil? || e.description == "" || e.description == {}
		e.air_date    = episode["FirstAired"][0]
		e.air_date = nil if e.air_date == "" || e.air_date == {} #stupid postgres error
		e.picture_url = episode["filename"]
		e.picture_url = "" if e.picture_url.nil? || e.picture_url == {}
		e.picture_url = "http://thetvdb.com/banners/#{e.picture_url}" if e.picture_url != "" 
		e.save!

		#something with guest stars could go here...
	}

	#create all the actors and roles for this series
	
#	actors = Thetvdb.break_array(series["Actors"][0])

#	actors.each{|actor|
#		parts = actor.split(" ")
#		first = parts[0]
#		rest_a = parts[1..-1] || []	#avoid trying to join nil
#		rest   = rest_a.join(" ")
#
#		actor_obj = Actor.find_or_create_by_first_name_and_last_name(first,rest)
#
#		#since we don't have role info, just create generic role
#		Role.find_or_create_by_series_item_id_and_actor_id_and_character_name(series_obj.id, actor_obj.id, "Main character")
#	}
}
