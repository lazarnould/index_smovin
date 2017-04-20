class LandlordsController < ApplicationController
  def create
    @lease = Lease.find(params[:lease_id])
    @landlord = Landlord.new(landlord_params)

    if @landlord.save
      @lease.landlord =  @landlord
      @lease.save
      respond_to do |format|
        format.html { redirect_to edit_lease_path(@lease) }
        format.js  # <-- will render `app/views/landlords/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'leases/edit' }
        format.js  # <-- idem
      end
    end
  end

  private

  def landlord_params
    params.require(:landlord).permit(:first_name,:last_name,:address,:number,:zip,:locality,:email,:baccount,:follower)
  end

end
