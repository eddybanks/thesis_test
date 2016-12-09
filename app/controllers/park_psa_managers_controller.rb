class ParkPsaManagersController < ApplicationController
  before_action :set_park_psa_manager, only: [:show, :edit, :update, :destroy]

  # GET /park_psa_managers
  # GET /park_psa_managers.json
  def index
    @park_psa_managers = ParkPsaManager.all
  end

  # GET /park_psa_managers/1
  # GET /park_psa_managers/1.json
  def show
  end

  # GET /park_psa_managers/new
  def new
    @park_psa_manager = ParkPsaManager.new
  end

  # GET /park_psa_managers/1/edit
  def edit
  end

  # POST /park_psa_managers
  # POST /park_psa_managers.json
  def create
    @park_psa_manager = ParkPsaManager.new(park_psa_manager_params)

    respond_to do |format|
      if @park_psa_manager.save
        format.html { redirect_to @park_psa_manager, notice: 'Park psa manager was successfully created.' }
        format.json { render :show, status: :created, location: @park_psa_manager }
      else
        format.html { render :new }
        format.json { render json: @park_psa_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /park_psa_managers/1
  # PATCH/PUT /park_psa_managers/1.json
  def update
    respond_to do |format|
      if @park_psa_manager.update(park_psa_manager_params)
        format.html { redirect_to @park_psa_manager, notice: 'Park psa manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @park_psa_manager }
      else
        format.html { render :edit }
        format.json { render json: @park_psa_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /park_psa_managers/1
  # DELETE /park_psa_managers/1.json
  def destroy
    @park_psa_manager.destroy
    respond_to do |format|
      format.html { redirect_to park_psa_managers_url, notice: 'Park psa manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park_psa_manager
      @park_psa_manager = ParkPsaManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_psa_manager_params
      params.require(:park_psa_manager).permit(:name, :email, :number)
    end
end
