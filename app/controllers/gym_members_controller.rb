class GymMembersController < ApplicationController

  def index
    @gym = Gym.find(params[:gym_id])
    # require "pry"; binding.pry
    @members = @gym.members
    #first have to grab all artist objects before sending to views
    #put a pry to see what we can get using params
  end

  def new
    @gym = Gym.find(params[:gym_id])
  end

  def create
    # require "pry"; binding.pry
    gym = Gym.find(params[:gym_id])
    member = gym.members.create!(gym_members_params)
    redirect_to "/gyms/#{gym.id}/members"
  end

  private
    def gym_members_params
      params.permit(:first_name, :last_name, :address, :zipcode, :phone, :dues_current)
    end
end
