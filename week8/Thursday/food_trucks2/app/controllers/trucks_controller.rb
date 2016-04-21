class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      render :show, status: :created, location: @truck
    else
      render :errors, status: 400
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    if @truck.update(truck_params)
      render :show, status: :ok, location: @truck
    else
      render :errors, status: 400
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.permit(:name, :description, :food_style)
    end
end
