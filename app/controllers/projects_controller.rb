class ProjectsController < ApplicationController

  def index
    @projects = if params[:search]
      Project.where("title LIKE ?", "%#{params[:search]}%")
    else
      Project.all
    end

    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @projects }
      format.js
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    # @pledge = @project.pledges.build

    @rewards = @project.rewards

    # @pledge_total = @project.pledges.all[amount:].inject(0) {|prev, curr|
    #   prev + curr
    # }
    @pledge_total = 0
    @project.pledges.each { |pledge|
      @pledge_total += pledge.amount
    }

    respond_to do |format|
      format.html
      format.json { render json: @resource }
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project successfully created!"
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project)
          .permit(:title, :description, :goal, :end_date,
                  rewards_attributes: [:title, :description, :amount, :_destroy])
  end
end
