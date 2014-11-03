class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :price
      t.integer :body_id

      t.timestamps
    end
  end
end
