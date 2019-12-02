class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine= Heroine.find(params[:id])
    # for some reason I could not get the following to pull the data in my show file: 
      # @heroine.power.name
    # To fix it, I'm trying to write some code to pull that data:
    power_id = @heroine.power_id
    @power= Power.find(power_id)
    
  end

  def new
    @heroine= Heroine.new
  end

  def create
    @heroine= Heroine.new(heroine_params)

    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
