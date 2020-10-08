class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(user_id: current_user.id)
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    if @comment.save
      redirect_to board_task_path(@task.board_id, @task.id), notice: 'I saved it!'
    else
      flash.now[:error] = 'I failed to save it.'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
