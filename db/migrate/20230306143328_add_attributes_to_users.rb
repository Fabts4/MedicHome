class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :ssn, :string
    add_column :users, :mutuelle_name, :string
    add_column :users, :mutuelle_number, :string
    add_column :users, :rpps, :string
    add_column :users, :doctor, :boolean, default: false
  end
end
