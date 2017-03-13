class LeasesController < ApplicationController
  before_action :find_lease, only: [:edit, :update, :generate_pdf, :destroy]

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    sign_month = Date::MONTHNAMES[@lease.start_month]
    # get data from json
      file = File.read('app/assets/datas/health_indices.json')
      data_hash = JSON.parse(file)
      sign_index = data_hash[sign_month + " " + @lease.start_year.to_s]
      x = Date.today - 1.month
      current_date = x.strftime("%B") + " " + Date.today.year.to_s
      current_index = data_hash[current_date]
    # method for indexation
      indexation = index(@lease.rent, current_index, sign_index)
      @lease.new_rent = indexation
      @lease.save
      redirect_to edit_lease_path(@lease)
  end

  def edit
  end

  def update
    @lease.update(lease_params)
  end

  def generate_pdf
    # blabla method to generate the pdf on base of
  end

  def destroy
    @lease.destroy
  end

  def index(rent, new_index, signature_index)
    i = rent.to_f
    j = new_index.to_f
    k = signature_index.to_f
    new_index = i * j / k
    return new_index
  end

  private

  def find_lease
    @lease = Lease.find(params[:id])
  end

  def lease_params
    params.require(:lease).permit(:rent, :signature_month, :signature_year, :start_month, :start_year, :indexation_year, :region)
  end

end
