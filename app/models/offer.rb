class Offer < ActiveRecord::Base
	include ModelApiAble
	
	belongs_to :flat
	belongs_to :source
end
