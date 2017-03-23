class AddIndexationStartToLease < ActiveRecord::Migration
  def change
    add_column :leases, :indexation_start, :string
  end
end
