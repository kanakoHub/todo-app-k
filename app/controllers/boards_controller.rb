class BoardsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_board, only: [:edit, :update]

    def index
        @boards = Board.all
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to boards_path(@board), notice: 'I saved it!'
        else
            flash.now[:error] = 'I failed to save it.'
            render :new
        end
    end

    def edit

    end

    def update
        if @board.update(board_params)
            redirect_to root_path, notice: 'Board Update!'
        else
            flash.now[:error] = "I couldn't update."
            render :edit
        end
    end

    def destroy
        board = current_user.boards.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: "I deleted it."
    end

    def show
        @board = Board.find(params[:id])
        @tasks = @board.tasks
    end
    
    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

    def set_board
        @board = current_user.boards.find(params[:id])
    end
end