class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = find_heroine
    @powers = Power.all
  end 

  def new
    @heroine = Heroine.new
  end 

  def create
    @heroine = Heroine.new(heroine_params(:super_name, :name, :power_id))
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else 
      render :new
    end 
  end 

  def search
  end 




  private

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end 

  def find_heroine
    Heroine.find(params[:id])
  end 
  
end
