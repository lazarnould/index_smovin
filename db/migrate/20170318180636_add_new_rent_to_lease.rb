class AddNewRentToLease < ActiveRecord::Migration
  def change
    add_column :leases, :new_rent, :decimal
  end
end
