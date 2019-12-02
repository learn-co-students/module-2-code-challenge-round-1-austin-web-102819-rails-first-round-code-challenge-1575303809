class HeroinesController < ApplicationController
  # before_action :find_by_id, only: [:show]
  
  def search
    query = params[:q]
    @heroines = []
    # @heroines1 = Heroine.all
    power_id = 0

    Power.all.each do |power|
      if power.name.downcase.include?(query.downcase)
        power_id = power.id
      end
    end

    Heroine.all.each do |h|
      if h.power_id == power_id
        @heroines << h
      end
    end 

    @heroines
    # byebug

    redirect_to '/'
  end

  def index
    @heroines = Heroine.all
  end

  def show
    find_by_id
    @powers = Power.all
  end

  def new
    @powers = Power.all
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(post_params(:name, :super_name, :power_id))
    
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      redirect_to '/heroines/new'
    end
  end

  private
  def find_by_id
    @heroine = Heroine.find(params[:id])
  end

  def post_params(*args)
    params.require(:heroine).permit(args)
  end
end
