class CreateAssemblyLines < ActiveRecord::Migration
  def change
    create_table :assembly_lines do |t|
      t.integer :car_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
