class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
