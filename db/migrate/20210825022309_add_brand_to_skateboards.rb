class AddBrandToSkateboards < ActiveRecord::Migration[5.2]
  def change
    add_reference :skateboards, :brand, foreign_key: true
  end
end
