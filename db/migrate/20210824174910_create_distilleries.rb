class CreateDistilleries < ActiveRecord::Migration[5.2]
  def change
    create_table :distilleries do |t|
      t.string :name
      t.boolean :scotland_location
      t.numeric :established
      t.timestamps
    end
  end
end
