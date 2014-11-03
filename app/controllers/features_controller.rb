class FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end
  def new
    @feature = Feature.new

  end
  def create
    @feature = Feature.new(params_permitted)
    if(@feature.save)
      redirect_to features_path
    else
      render 'new'
    end
  end
  def params_permitted
    params.require(:feature).permit(:name, :price)
  end
  def show
    @feature = Feature.find(params[:id])
  end
  def edit
    @feature = Feature.find(params[:id])
  end
  def update
    @feature = Feature.find(params[:id])
    if(@feature.update params_permitted)
      redirect_to features_path
    else
      render 'new'
    end
  end
  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to bodies_path
  end
end