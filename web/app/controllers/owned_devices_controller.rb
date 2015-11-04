class OwnedDevicesController < ApplicationController
  before_action :set_owned_device, only: [:show, :edit, :update, :destroy]

  # GET /owned_devices
  # GET /owned_devices.json
  def index
    @owned_devices = OwnedDevice.all
  end

  # GET /owned_devices/1
  # GET /owned_devices/1.json
  def show
  end

  # GET /owned_devices/new
  def new
    @owned_device = OwnedDevice.new
  end

  # GET /owned_devices/1/edit
  def edit
  end

  # POST /owned_devices
  # POST /owned_devices.json
  def create
    @owned_device = OwnedDevice.new(owned_device_params)

    respond_to do |format|
      if @owned_device.save
        format.html { redirect_to @owned_device, notice: 'Owned device was successfully created.' }
        format.json { render :show, status: :created, location: @owned_device }
      else
        format.html { render :new }
        format.json { render json: @owned_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owned_devices/1
  # PATCH/PUT /owned_devices/1.json
  def update
    respond_to do |format|
      if @owned_device.update(owned_device_params)
        format.html { redirect_to @owned_device, notice: 'Owned device was successfully updated.' }
        format.json { render :show, status: :ok, location: @owned_device }
      else
        format.html { render :edit }
        format.json { render json: @owned_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_devices/1
  # DELETE /owned_devices/1.json
  def destroy
    @owned_device.destroy
    respond_to do |format|
      format.html { redirect_to owned_devices_url, notice: 'Owned device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_device
      @owned_device = OwnedDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owned_device_params
      params.require(:owned_device).permit(:user_id, :charger_id, :personal_device_name)
    end
end
