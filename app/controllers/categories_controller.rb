class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])


    if @category.projects.any?
      @projects = @category.projects
      @projects = @projects.order('projects.created_at DESC').page(params[:page])
    end
  end
end
