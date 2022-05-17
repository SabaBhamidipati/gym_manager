class GymsController < ApplicationController

  def index
    @gyms = Gym.order_by_created_at
    # require "pry"; binding.pry
    #order by is class method and can be called here
    #any method created in model s/b used in controller if used to org data, not in view
    #by default Gym.all created in ascending order
  end

  def show
    # require "pry"; binding.pry
    @gym = Gym.find(params[:id])
    #params gets information from the URL found in the test
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

  private
    def gym_params
      params.permit(:name, :zip_code, :member_cost, :member_initiation_fee, :guest_cost, :open)
    end
end
