class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.integer :price, null: false
    	t.references :source
    	t.references :flat
    	
      t.timestamps null: false
    end
  end
end
