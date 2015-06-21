class MetroStationsController < ApplicationController
  before_action :set_metro_station, only: [:show, :edit, :update, :destroy]

  # GET /metro_stations
  # GET /metro_stations.json
  def index
    @metro_stations = MetroStation.all
  end

  # GET /metro_stations/1
  # GET /metro_stations/1.json
  def show
  end

  # GET /metro_stations/new
  def new
    @metro_station = MetroStation.new
  end

  # GET /metro_stations/1/edit
  def edit
  end

  # POST /metro_stations
  # POST /metro_stations.json
  def create
    @metro_station = MetroStation.new(metro_station_params)

    respond_to do |format|
      if @metro_station.save
        format.html { redirect_to @metro_station, notice: 'Metro station was successfully created.' }
        format.json { render :show, status: :created, location: @metro_station }
      else
        format.html { render :new }
        format.json { render json: @metro_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metro_stations/1
  # PATCH/PUT /metro_stations/1.json
  def update
    respond_to do |format|
      if @metro_station.update(metro_station_params)
        format.html { redirect_to @metro_station, notice: 'Metro station was successfully updated.' }
        format.json { render :show, status: :ok, location: @metro_station }
      else
        format.html { render :edit }
        format.json { render json: @metro_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metro_stations/1
  # DELETE /metro_stations/1.json
  def destroy
    @metro_station.destroy
    respond_to do |format|
      format.html { redirect_to metro_stations_url, notice: 'Metro station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metro_station
      @metro_station = MetroStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metro_station_params
      params[:metro_station]
    end
end
