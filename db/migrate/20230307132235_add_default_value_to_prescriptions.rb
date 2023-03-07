class AddDefaultValueToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    change_column_default :prescriptions, :status, 0
  end
end
