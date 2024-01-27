class MinesweeperService
  def self.generate_board(width, height, mines_count)
    # Create a blank board (2 dimensional array)
    board = Array.new(height) { Array.new(width, 0) }

    # Start the track for placed mines
    placed_mines = 0

    while placed_mines < mines_count
      x = rand(width)
      y = rand(height)

      # Place a mine only if there isn't one already
      # rubocop:disable Style/NumericPredicate
      next unless (board[y][x]) == 0
      # rubocop:enable Style/NumericPredicate
      board[y][x] = 'X' # 'X' represents a mine
      placed_mines += 1
    end

    # Return the board
    board
  end
end
