class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end

    if @category.projects.any?
      @projects = @category.projects
      @projects = @projects.order('projects.created_at DESC').page(params[:page])
    end
  end
end
