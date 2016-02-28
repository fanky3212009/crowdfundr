class CommentsController < ApplicationController
before_action :load_project, only: [:show, :create, :destroy]

def show
  @comment = Comment.find(params[:id])
end

def create
  @comment = @project.comments.build(comment_params)
  @comment.user = current_user

  if @comment.save
    redirect_to @project
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to projects_path
end

private
def comment_params
  params.require(:comment).permit(:message, :project_id, :user_id)
end

def load_project
  @project = Project.find(params[:project_id])
end

end
