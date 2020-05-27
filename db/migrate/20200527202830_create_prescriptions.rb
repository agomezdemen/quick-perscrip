class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.string :doctor_name
      t.string :patient_name
      t.integer :dosage
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :drug_id

      t.timestamps
    end
  end
end
