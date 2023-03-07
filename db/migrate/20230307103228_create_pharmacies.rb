class CreatePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
