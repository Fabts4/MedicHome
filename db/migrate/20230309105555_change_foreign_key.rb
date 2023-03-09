class ChangeForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cart_items, column: :basket_id
  end
end
