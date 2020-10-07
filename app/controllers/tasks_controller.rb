class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_task, only: [:edit, :update]

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  def edit

  end

  def update
      if @task.update(task_params)
          redirect_to board_task_path(@task.board_id, @task.id), notice: 'Task Update!'
      else
          flash.now[:error] = "I couldn't update."
          render :edit
      end
  end

  def destroy
      task = current_user.tasks.find(params[:id])
      task.destroy!
      redirect_to board_path(task.board_id), notice: "I deleted it."
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :closing_day, :eyecatch)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end