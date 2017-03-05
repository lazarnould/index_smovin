class AddNewRentToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :new_rent, :integer
  end
end
