class CarsController < ApplicationController
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
    @bodies = Body.all
    @features = Feature.all
  end
  def create
    @car = Car.new(params_permitted)
    if(@car.save)
      @car.body_id = params[:body][:body_id]
      params[:feature_ids].each do |f|
        assembly = AssemblyLine.new
        assembly.car_id = @car.id
        assembly.feature_id = f
        assembly.save
      end
      @car.save
      redirect_to cars_path
    else
      render 'new'
    end
  end
  def params_permitted
    params.require(:car).permit(:brand, :model, :price, :body_id, :feature_ids)
  end
  def show
    @car = Car.find(params[:id])
  end
  def edit
    @car = Car.find(params[:id])
    @bodies = Body.all
    @features = Feature.all
  end
  def update
    @car = Car.find(params[:id])
    @car.body_id = params[:body][:body_id]
    if(@car.update params_permitted)
      @car.assembly_lines.each do |a|
        a.destroy
      end
      params[:feature_ids].each do |f|
        assembly = AssemblyLine.new
        assembly.car_id = @car.id
        assembly.feature_id = f
        assembly.save
      end
      redirect_to cars_path
    else
      render 'new'
    end
  end
  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end
end