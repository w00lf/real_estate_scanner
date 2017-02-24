class Flat < ActiveRecord::Base
	include ModelApiAble

	has_many :offers
  belongs_to :metro_station

  accepts_nested_attributes_for :offers
end
