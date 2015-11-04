class OwnedChargersController < ApplicationController
  before_action :set_owned_charger, only: [:show, :edit, :update, :destroy]

  # GET /owned_chargers
  # GET /owned_chargers.json
  def index
    @owned_chargers = OwnedCharger.all
  end

  # GET /owned_chargers/1
  # GET /owned_chargers/1.json
  def show
  end

  # GET /owned_chargers/new
  def new
    @owned_charger = OwnedCharger.new
  end

  # GET /owned_chargers/1/edit
  def edit
  end

  # POST /owned_chargers
  # POST /owned_chargers.json
  def create
    @owned_charger = OwnedCharger.new(owned_charger_params)

    respond_to do |format|
      if @owned_charger.save
        format.html { redirect_to @owned_charger, notice: 'Owned charger was successfully created.' }
        format.json { render :show, status: :created, location: @owned_charger }
      else
        format.html { render :new }
        format.json { render json: @owned_charger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owned_chargers/1
  # PATCH/PUT /owned_chargers/1.json
  def update
    respond_to do |format|
      if @owned_charger.update(owned_charger_params)
        format.html { redirect_to @owned_charger, notice: 'Owned charger was successfully updated.' }
        format.json { render :show, status: :ok, location: @owned_charger }
      else
        format.html { render :edit }
        format.json { render json: @owned_charger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_chargers/1
  # DELETE /owned_chargers/1.json
  def destroy
    @owned_charger.destroy
    respond_to do |format|
      format.html { redirect_to owned_chargers_url, notice: 'Owned charger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_charger
      @owned_charger = OwnedCharger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owned_charger_params
      params.require(:owned_charger).permit(:user_id, :charger_id, :personal_charger_name)
    end
end
