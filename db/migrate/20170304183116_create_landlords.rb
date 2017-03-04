class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :number
      t.integer :zip
      t.string :locality
      t.string :email
      t.string :baccount
      t.boolean :follower

      t.timestamps null: false
    end
  end
end
