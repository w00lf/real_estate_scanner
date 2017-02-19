class OfferType < ActiveRecord::Base
	include ModelApiAble
	
	class << self
		def rent
			find_by(title: 'rent')
		end

		def buy
			find_by(title: 'buy')
		end
	end
end
