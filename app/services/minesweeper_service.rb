class MinesweeperService
  def self.generate_board(width, height, mines_count)
    # Create a blank board
    board = Array.new(height) { Array.new(width, 0) }

    # Randomly place mines
    mines_count.times do
      x, y = rand(width), rand(height)
      board[y][x] = 'X' # 'X' represents a mine
    end

    # Return the board
    board
  end
end