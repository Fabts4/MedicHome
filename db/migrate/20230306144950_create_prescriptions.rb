class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.date :date
      t.integer :status
      t.references :doctor, null: false
      t.references :patient, null: false

      t.timestamps
    end
    add_foreign_key :prescriptions, :users, column: :doctor_id
    add_foreign_key :prescriptions, :users, column: :patient_id
  end

end
