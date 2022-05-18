class GymMembersController < ApplicationController

  def index
    @gym = Gym.find(params[:gym_id])
    if params[:sort].present?
      @members = @gym.members.sort_alphabetically
    elsif params[:threshold].present?
      @members = @gym.members.filter_to(params[:threshold])
    else
      @members = @gym.members
    end
  end

  def new
    @gym = Gym.find(params[:gym_id])
  end

  def create
    gym = Gym.find(params[:gym_id])
    member = gym.members.create!(gym_members_params)
    redirect_to "/gyms/#{gym.id}/members"
  end

  private
    def gym_members_params
      params.permit(:first_name, :last_name, :address, :zipcode, :phone, :dues_current)
    end
end
