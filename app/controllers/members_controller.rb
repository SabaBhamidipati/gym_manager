class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    # require "pry"; binding.pry
    @member = Member.find(params[:id])
    #params gets information from the URL found in the test
  end
end
