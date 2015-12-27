class Flat < ActiveRecord::Base
  update_index('flats#flat') { self } 

  belongs_to :metro_station
  belongs_to :source
end
