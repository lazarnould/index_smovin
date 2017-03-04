class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.integer :signature_month
      t.integer :signature_year
      t.integer :start_month
      t.integer :start_year
      t.integer :indexation_year
      t.string :region
      t.references :landlord, index: true, foreign_key: true
      t.references :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
