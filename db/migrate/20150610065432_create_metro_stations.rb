class CreateMetroStations < ActiveRecord::Migration
  def change
    create_table :metro_stations do |t|
      t.integer :flats_count
      t.string :title
      
      t.timestamps
    end
  end
end
