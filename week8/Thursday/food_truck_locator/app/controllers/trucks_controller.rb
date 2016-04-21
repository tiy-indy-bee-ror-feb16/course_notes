class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all

    render json: @trucks
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    render json: @truck
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      render json: @truck, status: :created, location: @truck
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    @truck = Truck.find(params[:id])

    if @truck.update(truck_params)
      head :no_content
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy

    head :no_content
  end

  private

    def set_truck
      @truck = Truck.find(params[:id])
    end

    def truck_params
      params.require(:truck).permit(:name, :description, :food_style)
    end
end
