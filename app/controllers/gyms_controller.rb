class GymsController < ApplicationController

  def index
    @gyms = Gym.order_by_created_at
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
  end

  def create
    Gym.create(gym_params)
    redirect_to '/gyms'
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    gym = Gym.find(params[:id])
    gym.update(gym_params)
    redirect_to "/gyms/#{gym.id}"
  end

  def destroy
    gym = Gym.destroy(params[:id])
    redirect_to '/gyms'
  end

  private
    def gym_params
      params.permit(:name, :zip_code, :member_cost, :member_initiation_fee, :guest_cost, :open)
    end
end
