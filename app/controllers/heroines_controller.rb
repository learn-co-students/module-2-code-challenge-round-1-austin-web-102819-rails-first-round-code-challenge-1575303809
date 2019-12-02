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
    @heroine = Heroine.new(h_params)
    @heroine.save
    redirect_to @heroine
  end  

  private
  
  def h_params
    params.require(:heroine).permit! 
  end
end
