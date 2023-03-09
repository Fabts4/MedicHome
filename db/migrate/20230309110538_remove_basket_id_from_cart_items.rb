class RemoveBasketIdFromCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :basket_id
  end
end
