class AddTypeToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :type, :string
  end
end
