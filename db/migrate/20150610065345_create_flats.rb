class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :house_floors
      t.integer :floor 
      t.integer :square 
      t.integer :price, null: false
      t.integer :source_inner_id
      t.string :address

      t.references :metro_station
      t.references :source_inner_id
      t.references :source
      t.timestamps
    end
  end
end
