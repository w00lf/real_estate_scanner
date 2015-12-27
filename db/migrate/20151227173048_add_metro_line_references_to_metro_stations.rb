class AddMetroLineReferencesToMetroStations < ActiveRecord::Migration
  def change
    add_reference :metro_stations, :metro_line, index: true
  end
end
