class TagsController < ApplicationController

  def new
    # # @project = Project.find(params[:id])
    # @tag = Tag.new
    #
    # respond_to do |format|
    #   format.html
    #   format.json { render "Hey" }
    # end

  end

  def show
    @tag = Tag.find(params[:id])
    
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      # @tag_name = @tag.name
      respond_to do |format|
        format.html
        format.js

      end
    end

  end

  def destroy
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :taggable_id, :taggable_type)
    #code
  end
end
