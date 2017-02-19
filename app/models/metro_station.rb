class MetroStation < ActiveRecord::Base
	include ModelApiAble
  belongs_to :metro_line
end
