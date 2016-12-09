class FullFilmLocationDataController < ApplicationController
  before_action :set_full_film_location_datum, only: [:show, :edit, :update, :destroy]

  # GET /full_film_location_data
  # GET /full_film_location_data.json
  def index
    @full_film_location_data = FullFilmLocationDatum.all
  end

  # GET /full_film_location_data/1
  # GET /full_film_location_data/1.json
  def show
  end

  # GET /full_film_location_data/new
  def new
    @full_film_location_datum = FullFilmLocationDatum.new
  end

  # GET /full_film_location_data/1/edit
  def edit
  end

  # POST /full_film_location_data
  # POST /full_film_location_data.json
  def create
    @full_film_location_datum = FullFilmLocationDatum.new(full_film_location_datum_params)

    respond_to do |format|
      if @full_film_location_datum.save
        format.html { redirect_to @full_film_location_datum, notice: 'Full film location datum was successfully created.' }
        format.json { render :show, status: :created, location: @full_film_location_datum }
      else
        format.html { render :new }
        format.json { render json: @full_film_location_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /full_film_location_data/1
  # PATCH/PUT /full_film_location_data/1.json
  def update
    respond_to do |format|
      if @full_film_location_datum.update(full_film_location_datum_params)
        format.html { redirect_to @full_film_location_datum, notice: 'Full film location datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @full_film_location_datum }
      else
        format.html { render :edit }
        format.json { render json: @full_film_location_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /full_film_location_data/1
  # DELETE /full_film_location_data/1.json
  def destroy
    @full_film_location_datum.destroy
    respond_to do |format|
      format.html { redirect_to full_film_location_data_url, notice: 'Full film location datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_full_film_location_datum
      @full_film_location_datum = FullFilmLocationDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def full_film_location_datum_params
      params.require(:full_film_location_datum).permit(:title, :release_year, :locations, :fun_facts, :production_company, :distributor, :director, :writer, :actor1, :actor2, :actor3)
    end
end
