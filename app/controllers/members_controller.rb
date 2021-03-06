class MembersController < ApplicationController

  def index
    @members = Member.dues_current_only
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to "/members/#{member.id}"
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to "/members"
  end

  private
    def member_params
      params.permit(:first_name, :last_name, :address, :zipcode, :phone, :dues_current)
    end
end
