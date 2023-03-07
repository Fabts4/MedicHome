class AddDefaultStatusToBaskets < ActiveRecord::Migration[7.0]
  def change
    change_column_default :baskets, :status, 0
  end
end
