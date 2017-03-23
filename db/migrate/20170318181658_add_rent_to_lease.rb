class AddRentToLease < ActiveRecord::Migration
  def change
    add_column :leases, :rent, :decimal
  end
end
