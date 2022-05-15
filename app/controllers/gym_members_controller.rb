class GymMembersController < ApplicationController

  def index
    @gym = Gym.find(params[:gym_id])
    # require "pry"; binding.pry
    @members = @gym.members
    #first have to grab all artist objects before sending to views
    #put a pry to see what we can get using params
  end
end
