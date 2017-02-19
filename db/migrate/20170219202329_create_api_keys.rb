class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys, id: :uuid do |t|
      t.references :owner, polymorphic: true, index: true
    end
  end
end
