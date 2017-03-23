class AddCurrentIndexToLease < ActiveRecord::Migration
  def change
    add_column :leases, :current_index, :decimal
  end
end
