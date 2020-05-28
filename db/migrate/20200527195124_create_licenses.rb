class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.integer :number
      t.integer :doctor_id

      t.timestamps
    end
  end
end
