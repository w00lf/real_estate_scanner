class CreateOfferTypes < ActiveRecord::Migration
  def change
    create_table :offer_types do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
