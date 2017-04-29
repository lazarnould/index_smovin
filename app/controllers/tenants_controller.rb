class TenantsController < ApplicationController
  def create
    @lease = Lease.find(params[:lease_id])
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      @lease.tenant = @tenant
      @lease.save
      redirect_to lease_path(@lease)
    else
      render :new
    end
  end

  private
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :address, :number, :zip, :locality, :property_type)
  end
end
