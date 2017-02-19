class Flat < ActiveRecord::Base
	include ModelApiAble
  update_index('flats#flat') { self } 

	has_many :offers
  belongs_to :metro_station
  belongs_to :source

  accepts_nested_attributes_for :offers
end
