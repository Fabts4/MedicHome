class AddAdministrationToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :administration, :string
  end
end
