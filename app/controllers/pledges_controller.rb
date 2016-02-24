class PledgesController < ApplicationController

  def new
  end

  def show
  end

  def create
    @pledge = Pledge.new(params[pledge_params])

    if @pledge.save
      redirect_to :back, notice: "Pledge created"
    else

    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:amount, :user_id, :project_id)
  end
end
