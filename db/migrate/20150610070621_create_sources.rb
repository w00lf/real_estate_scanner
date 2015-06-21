class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.string :parser
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
