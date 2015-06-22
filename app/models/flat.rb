class Flat < ActiveRecord::Base
  belongs_to :metro_station
  belongs_to :source
end
