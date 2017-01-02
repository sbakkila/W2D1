require 'byebug'
require_relative 'piece.rb'

class Board

  attr_accessor :grid

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def initialize()
    @grid = Array.new(8) { Array.new(8) }

    (0..7).each do |row_idx|
      (0..7).each do |col_idx|
        if row_idx == 1
          self[[row_idx, col_idx]]= Pawn.new([row_idx, col_idx], self, :black)
        elsif row_idx == 6
          self[[row_idx, col_idx]]= Pawn.new([row_idx, col_idx], self, :white)
        elsif row_idx == 0
          if col_idx == 0 || col_idx == 7
            self[[row_idx, col_idx]]= Rook.new([row_idx, col_idx], self, :black)
          elsif col_idx == 1 || col_idx == 6
            self[[row_idx, col_idx]]= Knight.new([row_idx, col_idx], self, :black)
          elsif col_idx == 2 || col_idx == 5
            self[[row_idx, col_idx]]= Bishop.new([row_idx, col_idx], self, :black)
          elsif col_idx == 3
            self[[row_idx, col_idx]]= Queen.new([row_idx, col_idx], self, :black)
          elsif col_idx == 4
            self[[row_idx, col_idx]]= King.new([row_idx, col_idx], self, :black)
          end

        elsif row_idx == 7
          if col_idx == 0 || col_idx == 7
            self[[row_idx, col_idx]]= Rook.new([row_idx, col_idx], self, :white)
          elsif col_idx == 1 || col_idx == 6
            self[[row_idx, col_idx]]= Knight.new([row_idx, col_idx], self, :white)
          elsif col_idx == 2 || col_idx == 5
            self[[row_idx, col_idx]]= Bishop.new([row_idx, col_idx], self, :white)
          elsif col_idx == 3
            self[[row_idx, col_idx]]= Queen.new([row_idx, col_idx], self, :white)
          elsif col_idx == 4
            self[[row_idx, col_idx]]= King.new([row_idx, col_idx], self, :white)
          end
        else
          self[[row_idx, col_idx]]= NullPiece.new
        end
      end
    end


    # (0..7).each do |row_idx|
    #   (0..7).each do |col_idx|
    #     if (row_idx == 0 || row_idx == 1 || row_idx == 6 || row_idx == 7)
    #       self[[row_idx, col_idx]]= Piece.new([row_idx, col_idx], self)
    #     else
    #       self[[row_idx, col_idx]]= NullPiece.new
    #     end
    #   end
    # end

  end

  def move_piece(start_pos, end_pos)
    if (self[start_pos].class) == NullPiece
      raise InvalidMoves.new "There's no piece here"
    end
    if self[end_pos].class == Piece
      raise InvalidMoves.new 'You might not be able to do this'
    end
    # need more logic, based on type of piece, and color
    # put the piece end first
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new

  end

  def in_bounds(new_pos)
    x, y = new_pos
    (x <= 7 && y <= 7 && x >= 0 && y >= 0)
  end

end

class InvalidMoves < StandardError

end


# board = Board.new
# p board
# p board.move_piece([4,4],[4,0])
# p board
