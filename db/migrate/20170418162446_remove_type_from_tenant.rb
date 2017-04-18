class RemoveTypeFromTenant < ActiveRecord::Migration
  def change
    remove_column :tenants, :type, :string
  end
end
