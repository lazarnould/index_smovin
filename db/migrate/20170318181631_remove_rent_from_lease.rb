class RemoveRentFromLease < ActiveRecord::Migration
  def change
    remove_column :leases, :rent, :integer
  end
end
