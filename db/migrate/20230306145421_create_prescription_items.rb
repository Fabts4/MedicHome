class CreatePrescriptionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :prescription_items do |t|
      t.string :posology
      t.references :prescription, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
