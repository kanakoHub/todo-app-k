class BoardsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
    
    private
    def board_params
        # binding.pry
        params.require(:board).permit(:name, :description)
    end
end