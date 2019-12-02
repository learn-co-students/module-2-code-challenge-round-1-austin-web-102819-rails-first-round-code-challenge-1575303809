class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end
  
  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(allowed_params)
    if @heroine.valid?
      x = allowed_params[:name].split(" ")
      y = x.join
      @heroine.save
      redirect_to heroines_path
    else
      render :new
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = Power.all
  end



  private

def allowed_params
  params.require(:heroine).permit(:name, :super_name, :power_id)
end
end
