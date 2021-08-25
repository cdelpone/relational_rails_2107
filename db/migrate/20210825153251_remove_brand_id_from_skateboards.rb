class RemoveBrandIdFromSkateboards < ActiveRecord::Migration[5.2]
  def change
    remove_column :skateboards, :brand_id_id, :string
  end
end
