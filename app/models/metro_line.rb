class MetroLine < ActiveRecord::Base
	include ModelApiAble
  has_many :metro_stations
end
