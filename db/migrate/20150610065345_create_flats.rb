class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :house_floors
      t.integer :floor 
      t.integer :square 
      t.integer :price, null: false
      t.string :address
      t.string :source_inner_id

      t.references :metro_station
      t.references :source
      t.timestamps
    end
  end
end
