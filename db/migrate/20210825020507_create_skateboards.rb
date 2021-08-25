class CreateSkateboards < ActiveRecord::Migration[5.2]
  def change
    create_table :skateboards do |t|
      t.string :board_name
      t.float :cost
      t.boolean :nose
      t.references :brand_id

      t.timestamps
    end
  end
end
