class AddRentToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :rent, :integer
  end
end
