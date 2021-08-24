class CreateScotches < ActiveRecord::Migration[5.2]
  def change
    create_table :scotches do |t|
      t.string :name
      t.boolean :single_malt
      t.numeric :year
      t.references :distilleries, foreign_key: true
      t.timestamps
    end
  end
end
