class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # def index
  #   @board = Board.find(params[:id])
  #   @tasks = @board.tasks.all
  # end

end