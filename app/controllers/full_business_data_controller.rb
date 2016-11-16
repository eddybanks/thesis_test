class FullBusinessDataController < ApplicationController
  before_action :set_full_business_datum, only: [:show, :edit, :update, :destroy]

  # GET /full_business_data
  # GET /full_business_data.json
  def index
    @full_business_data = FullBusinessDatum.order(:business_account_number).page params[:page]
  end

  # GET /full_business_data/1
  # GET /full_business_data/1.json
  def show
  end

  # GET /full_business_data/new
  def new
    @full_business_datum = FullBusinessDatum.new
  end

  # GET /full_business_data/1/edit
  def edit
  end

  # POST /full_business_data
  # POST /full_business_data.json
  def create
    @full_business_datum = FullBusinessDatum.new(full_business_datum_params)

    respond_to do |format|
      if @full_business_datum.save
        format.html { redirect_to @full_business_datum, notice: 'Full business datum was successfully created.' }
        format.json { render :show, status: :created, location: @full_business_datum }
      else
        format.html { render :new }
        format.json { render json: @full_business_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_business_data/1
  # PATCH/PUT /full_business_data/1.json
  def update
    respond_to do |format|
      if @full_business_datum.update(full_business_datum_params)
        format.html { redirect_to @full_business_datum, notice: 'Full business datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_business_datum }
      else
        format.html { render :edit }
        format.json { render json: @full_business_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_business_data/1
  # DELETE /full_business_data/1.json
  def destroy
    @full_business_datum.destroy
    respond_to do |format|
      format.html { redirect_to full_business_data_url, notice: 'Full business datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_business_datum
      @full_business_datum = FullBusinessDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_business_datum_params
      params.require(:full_business_datum).permit(:locationid, :business_account_number, :ownership_name, :dba_name, :street_address, :city, :state, :source_zipcode, :business_start_date, :business_end_date, :location_start_date, :location_end_date, :mail_address, :mail_city, :mail_zipcode, :mail_state, :naics_code, :naics_code_description, :parking_tax, :transient_occupancy_tax, :lic_code, :lic_code_description, :supervisor_district, :neighborhoods, :business_corridor, :business_location)
    end
end
