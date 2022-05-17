class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    # require "pry"; binding.pry
    @member = Member.find(params[:id])
    #params gets information from the URL found in the test
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to "/members/#{member.id}"
  end

  private
    def member_params
      params.permit(:first_name, :last_name, :address, :zipcode, :phone, :dues_current)
    end
end
