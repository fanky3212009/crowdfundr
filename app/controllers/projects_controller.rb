class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :destroy]

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
    # @pledge = @project.pledges.build

    if current_user
      @comment = @project.comments.build
    end

    @rewards = @project.rewards

    # @pledge_total = @project.pledges.all[amount:].inject(0) {|prev, curr|
    #   prev + curr
    # }
    @pledge_total = 0
    @project.pledges.each { |pledge|
      @pledge_total += pledge.amount
    }

  end

  def create

    if current_user
      @user = User.find(session[:user_id])
      @project = @user.owend_projects.build(project_params)

      if @project.save
        redirect_to projects_path, notice: "Project successfully created!"
      else
        render :new
      end
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project)
          .permit(:title, :description, :goal, :end_date, :category_id,
                  rewards_attributes: [:title, :description, :amount, :_destroy])
  end

  def load_project
    @project = Project.find(params[:id])
  end
end
