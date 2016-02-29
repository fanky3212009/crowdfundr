class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :category_list, :tag_list

  def category_list
    @categories = Category.all
  end

  def tag_list
    @tags = Tag.all
  end
end
