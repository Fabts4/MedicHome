class ChangeStatusColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :drug, :boolean, default: true
  end
end
