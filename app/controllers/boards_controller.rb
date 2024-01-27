class BoardsController < ApplicationController
  def index
    @recent_boards = Board.order(created_at: :desc).limit(10)
  end

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

  def all
    @boards = if params[:search].present?
                Board.where('name LIKE ? OR email LIKE ?',
                  "%#{params[:search]}%",
                  "%#{params[:search]}%")
                  .paginate(page: params[:page], per_page: 10)
              else
                Board.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
              end
  end

  private

  def board_params
    params.require(:board).permit(:width, :height, :mines_count, :name, :email)
  end
end
