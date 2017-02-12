class RemovePriceAndSourceIdFromFlats < ActiveRecord::Migration
  def change
  	remove_column :flats, :price
  	remove_reference(:flats, :source)
  end
end
