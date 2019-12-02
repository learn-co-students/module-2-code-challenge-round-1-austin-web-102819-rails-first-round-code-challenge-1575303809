class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end
  def show 
    @heroine = Heroine.find(params[:id])
  end
  def new
    @heroine = Heroine.new
  end 
  def create
    @heroine = Heroine.new 
    if @heroine.valid?
    @heroine.save(heroine_params)
    redirect_to @heroine
    else 
      render new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
