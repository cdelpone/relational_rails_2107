class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name
      t.numeric :established
      t.boolean :gnarly

      t.timestamps
    end
  end
end
