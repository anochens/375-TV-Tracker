Factory.define :channel do |f|
   f.name 'new series'
end 

Factory.define :series_item do |f|
   f.name 'new series'
   f.channel_id 1
   f.description 'Random description here'
end


Factory.define :episode do |f|
   f.season_id -1 
   f.episode_number 1 
   f.duration 3600
   f.air_date Time.now

end

Factory.define :season do |f|
   f.season_number 1
   f.start_date Time.now
end
