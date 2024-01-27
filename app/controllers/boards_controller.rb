class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.board_state = MinesweeperService.generate_board(@board.width, @board.height, @board.mines_count)

    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:width, :height, :mines_count, :name, :email)
  end
end