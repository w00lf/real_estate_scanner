class Offer < ActiveRecord::Base
	belongs_to :flat
	belongs_to :source
end
