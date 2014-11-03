class BodiesController < ApplicationController
  def index
    @bodies = Body.all
  end
  def new
    @body = Body.new

  end
  def create
    @body = Body.new(params_permitted)
    if(@body.save)
      redirect_to bodies_path
    else
      render 'new'
    end
  end
  def params_permitted
    params.require(:body).permit(:name, :doors)
  end
  def show
    @body = Body.find(params[:id])
  end
  def edit
    @body = Body.find(params[:id])
  end
  def update
    @body = Body.find(params[:id])
    if(@body.update params_permitted)
      redirect_to bodies_path
    else
      render 'new'
    end
  end
  def destroy
    @body = Body.find(params[:id])
    @body.destroy
    redirect_to features_path
  end
end