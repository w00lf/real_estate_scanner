class AddAddedAtToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :added_at, :datetime
  end
end
