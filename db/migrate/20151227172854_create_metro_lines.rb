class CreateMetroLines < ActiveRecord::Migration
  def change
    create_table :metro_lines do |t|
      t.string :title

      t.timestamps
    end
  end
end
