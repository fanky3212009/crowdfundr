class PledgesController < ApplicationController
  def new
  end

  def show
  end

  def create
    @project = Project.find(pledge_params[:project_id])
    @pledge = @project.pledges.build(pledge_params)


      if @pledge.save
      @pledge_total = 0
      @project.pledges.each { |pledge|
        @pledge_total += pledge.amount
      }

      respond_to do |format|
        format.html
        format.json { render json: @pledge_total }
      end
    end
    # if @pledge.save
    #   redirect_to :back, notice: "#{pledge_params}"
    # else
    #
    # end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:amount, :user_id, :project_id)
  end
end
