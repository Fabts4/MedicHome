class ChangeColumnsNames < ActiveRecord::Migration[7.0]
  def change
    rename_table :baskets, :carts
    rename_table :orders, :cart_items
  end
end
