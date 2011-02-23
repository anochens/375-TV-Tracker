Factory.define :channel do |f|
   f.name 'new series'
end 

Factory.define :series_item do |f|
   f.name 'new series'
   f.channel_id 1
   f.description 'Random description here'
end
