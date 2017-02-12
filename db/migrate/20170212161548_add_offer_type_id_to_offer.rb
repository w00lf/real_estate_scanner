class AddOfferTypeIdToOffer < ActiveRecord::Migration
  def change
    add_reference :offers, :offer_type
    add_index :offers, :offer_type_id
  end
end
