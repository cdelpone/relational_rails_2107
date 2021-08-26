class ChangeForeignKeyForScotches < ActiveRecord::Migration[5.2]
  def change
    rename_column :scotches, :distilleries_id, :distillery_id
  end
end
