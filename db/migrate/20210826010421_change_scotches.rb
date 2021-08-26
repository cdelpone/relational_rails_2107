class ChangeScotches < ActiveRecord::Migration[5.2]
  def change
    change_column :scotches, :year, :integer
  end
end
