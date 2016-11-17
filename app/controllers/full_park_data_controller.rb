class FullParkDataController < ApplicationController
  before_action :set_full_park_datum, only: [:show, :edit, :update, :destroy]

  # GET /full_park_data
  # GET /full_park_data.json
  def index
    @full_park_data = FullParkDatum.order(:park_name).page params[:page]
  end

  # GET /full_park_data/1
  # GET /full_park_data/1.json
  def show
  end

  # GET /full_park_data/new
  def new
    @full_park_datum = FullParkDatum.new
  end

  # GET /full_park_data/1/edit
  def edit
  end

  # POST /full_park_data
  # POST /full_park_data.json
  def create
    @full_park_datum = FullParkDatum.new(full_park_datum_params)

    respond_to do |format|
      if @full_park_datum.save
        format.html { redirect_to @full_park_datum, notice: 'Full park datum was successfully created.' }
        format.json { render :show, status: :created, location: @full_park_datum }
      else
        format.html { render :new }
        format.json { render json: @full_park_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_park_data/1
  # PATCH/PUT /full_park_data/1.json
  def update
    respond_to do |format|
      if @full_park_datum.update(full_park_datum_params)
        format.html { redirect_to @full_park_datum, notice: 'Full park datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_park_datum }
      else
        format.html { render :edit }
        format.json { render json: @full_park_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_park_data/1
  # DELETE /full_park_data/1.json
  def destroy
    @full_park_datum.destroy
    respond_to do |format|
      format.html { redirect_to full_park_data_url, notice: 'Full park datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_park_datum
      @full_park_datum = FullParkDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_park_datum_params
      params.require(:full_park_datum).permit(:park_name, :park_type, :park_service_area, :psa_manager, :email, :number, :zipcode, :acreage, :sup_dist, :parkid, :location, :lat)
    end
end
