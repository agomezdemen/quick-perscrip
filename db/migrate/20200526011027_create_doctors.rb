class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :license_id

      t.timestamps
    end
  end
end
