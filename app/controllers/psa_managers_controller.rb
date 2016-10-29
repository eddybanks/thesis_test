class PsaManagersController < ApplicationController
  before_action :set_psa_manager, only: [:show, :edit, :update, :destroy]

  # GET /psa_managers
  # GET /psa_managers.json
  def index
    @psa_managers = PsaManager.all
  end

  # GET /psa_managers/1
  # GET /psa_managers/1.json
  def show
  end

  # GET /psa_managers/new
  def new
    @psa_manager = PsaManager.new
  end

  # GET /psa_managers/1/edit
  def edit
  end

  # POST /psa_managers
  # POST /psa_managers.json
  def create
    @psa_manager = PsaManager.new(psa_manager_params)

    respond_to do |format|
      if @psa_manager.save
        format.html { redirect_to @psa_manager, notice: 'Psa manager was successfully created.' }
        format.json { render :show, status: :created, location: @psa_manager }
      else
        format.html { render :new }
        format.json { render json: @psa_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psa_managers/1
  # PATCH/PUT /psa_managers/1.json
  def update
    respond_to do |format|
      if @psa_manager.update(psa_manager_params)
        format.html { redirect_to @psa_manager, notice: 'Psa manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @psa_manager }
      else
        format.html { render :edit }
        format.json { render json: @psa_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psa_managers/1
  # DELETE /psa_managers/1.json
  def destroy
    @psa_manager.destroy
    respond_to do |format|
      format.html { redirect_to psa_managers_url, notice: 'Psa manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psa_manager
      @psa_manager = PsaManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def psa_manager_params
      params.require(:psa_manager).permit(:name, :email, :number)
    end
end
