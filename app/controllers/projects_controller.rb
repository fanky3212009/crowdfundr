class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])

    @rewards = @project.rewards
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project successfully created!"
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project)
          .permit(:title, :description, :goal, :end_date,
                  rewards_attributes: [:title, :description, :amount, :_destroy])
  end
end