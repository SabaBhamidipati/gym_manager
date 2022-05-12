class GymsController < ApplicationController

  def index
    @gyms = Gym.all
  end

  def show
    # require "pry"; binding.pry
    @gym = Gym.find(params[:id])
    #params gets information from the URL found in the test
  end
end
