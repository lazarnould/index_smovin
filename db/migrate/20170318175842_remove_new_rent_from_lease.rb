class RemoveNewRentFromLease < ActiveRecord::Migration
  def change
    remove_column :leases, :new_rent, :integer
  end
end
