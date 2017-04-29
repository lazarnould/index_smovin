class AddPropertyTypeToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :property_type, :string
  end
end
