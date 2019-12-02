class PowersController < ApplicationController
  before_action :find_by_id, only: [:show]

  def index
    @powers = Power.all
  end

  def show
    
  end

  private 
  def find_by_id
    @power = Power.find(params[:id])
  end
end
