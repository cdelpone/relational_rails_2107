class ChangeDistilleriesEstablished < ActiveRecord::Migration[5.2]
  def change
    change_column :distilleries, :established, :integer
  end
end
