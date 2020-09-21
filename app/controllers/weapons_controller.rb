class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all 
    render json: {status:'SUCESS',data:@weapons}, status: :ok
  end

  def create
    @weapons = Weapon.create(weapons_params)
    render json: {data: @weapons},status: :created
    
  end

  def delete
    @weapons_id = Weapon.find(params[:id])
    @weapons_id.destroy
    render json: {data:@weapons_id}, status: :ok

  end

  def show
    @weapons_id = Weapon.find(params[:id])
    render json: {data: @weapons_id},status: :ok
  end

  private def weapons_params
    params.require(:weapon).permit(:nome,:description,:power_base,:power_step,:level)
  end
end
