class AddSignIndexToLease < ActiveRecord::Migration
  def change
    add_column :leases, :sign_index, :decimal
  end
end
