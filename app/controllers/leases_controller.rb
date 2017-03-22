class LeasesController < ApplicationController
  before_action :find_lease, only: [:edit, :update, :show, :generate_pdf, :destroy]

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    sign_month = Date::MONTHNAMES[@lease.start_month]
    # get data from json
      file = File.read('app/assets/datas/health_indices.json')
      data_hash = JSON.parse(file)
      # Define sign index
        @lease.sign_index = data_hash[sign_month + " " + @lease.start_year.to_s]
      # Define current index on base of the region of the lease
        if @lease.region == "Région Wallonne"
          base_year = @lease.indexation_year - 1
          base_month = @lease.start_month - 1
          if base_month == 0
            changed_base_month = "December"
            changed_base_year = base_year - 1
            current_date = changed_base_month + " " + changed_base_year.to_s
            @lease.current_index = data_hash[current_date]
          else
            changed_base_month = Date::MONTHNAMES[base_month]
            current_date = changed_base_month + " " + base_year.to_s
            @lease.current_index = data_hash[current_date]
          end
        else
          base_month = @lease.start_month - 1
          if base_month == 0
            changed_base_month = "December"
            base_year = @lease.indexation_year - 1
            current_date = changed_base_month + " " + base_year.to_s
            @lease.current_index = data_hash[current_date]
          else
            current_date = Date::MONTHNAMES[base_month] + " " + @lease.indexation_year.to_s
            @lease.current_index = data_hash[current_date]
          end
        end
    # method for indexation
      indexation = index(@lease.rent, @lease.current_index, @lease.sign_index)
      @lease.new_rent = indexation
      if @lease.save
        redirect_to edit_lease_path(@lease)
      else
        render :new
      end
  end

  def edit
  end

  def update
    @lease.update(lease_params)
  end

  def show
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
  end

  private

  def find_lease
    @lease = Lease.find(params[:id])
  end

  def lease_params
    params.require(:lease).permit(:rent, :signature_month, :signature_year, :start_month, :start_year, :indexation_year, :region)
  end

end

